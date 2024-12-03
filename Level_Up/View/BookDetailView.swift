//
//  MovieDetailView.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 03/12/24.
//

import SwiftUI


struct BookDetailView: View {
    let img_logo = ImageResource(name: "ACLogo", bundle: .main)

    @Binding var book: Book
        
    var body: some View {
        VStack {
            Rectangle()
                .cornerRadius(32)
                .foregroundColor(Color(hex: 0x2b2b2b))
                .position(x:160, y:300)
                .frame(width: 320, height: 600)
                .overlay(
                    VStack {
                        Image(ImageResource(name: book.cover, bundle: .main))
                            .resizable()
                            .frame(width: 160, height: 240)
                            .cornerRadius(12)
                            .shadow(color: .purple, radius: 12, x: 0, y: 0)
                            .padding(.top, 10)
                        
                        Text(book.title)
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        Text(String(book.releaseYear))
                        
                        HStack{
                            Text("Sinossi")
                                .font(.headline)
                            Spacer()
                        }.padding(.leading, 10)
                            
                        ScrollView (.vertical) {
                            Text(book.synopsys)
                                .font(.system(size: 15))
                                .truncationMode(.tail)
                                
                        }.padding(.horizontal, 10)
                            .padding(.bottom, 10)
                    }.padding(.vertical, 20))
        }.preferredColorScheme(.dark)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image(img_logo)
                        .resizable()
                        .frame(width: 64, height: 64)
                }
            }
        
    }
       
}

#Preview {
    BookDetailView(book: .constant(Book(id: 0, title: "Assassin's Creed: Desert Oath", cover: "desert_oath", releaseYear: 2017, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit.")))
}
