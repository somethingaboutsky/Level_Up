//
//  GameDetailView.swift
//  LevelUp
//
//  Created by Ilenia Munfuletto on 29/11/24.
//

import SwiftUI

struct ChosenSectionView : View {
   
    var selectedSection: Section
    
    var body: some View {
        switch selectedSection {
        case .overview:
            GameDetailOverview(selectedSection: selectedSection)
        case .story:
            GameDetailStory()
        case .characters:
            let _ = print("characters")
        case .guides:
            let _ = print("guides")
        }
    }
}


struct GameMainView : View {
    @State  var selectedSection: Section = .overview
    let img_logo = ImageResource(name: "ACLogo", bundle: .main)
    
    var body: some View {
        VStack(alignment: .center) {
            Image(img_logo)
                .resizable()
                .frame(width: 64, height: 64)
            
            PickerSegmentedControl(selectedSection: $selectedSection)
            
        }
        .preferredColorScheme(.dark)
        
        ChosenSectionView(selectedSection: selectedSection)
    }
}



struct GameDetailOverview: View {
    var selectedSection: Section
    let img_logo =  ImageResource(name: "ACLogo", bundle: .main)
    
    var body: some View {
    
        
        Rectangle()
            .cornerRadius(32)
            .foregroundColor(Color(hex: 0x2b2b2b))
            .position(x:160, y:300)
            .frame(width: 320, height: 600)
            .overlay(
                VStack {
                    Image(img_logo)
                        .resizable()
                        .frame(width: 320, height: 300)
                        .shadow(color: .purple, radius: 12, x: 0, y: 0)
                    Text("Assassin's Creed : Game")
                        .font(.system(size: 28, weight: .bold))
                        
                })
    }
       
}




struct GameDetailStory: View {
    var body: some View {
        Text("Story")
        Spacer()
    }
    
}


enum Section : String, CaseIterable {
    case overview = "Overview"
    case story = "Story"
    case characters = "Characters"
    case guides = "Guides"
}


extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

    

#Preview {
    GameMainView()
}

