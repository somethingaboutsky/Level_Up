//
//  OnboardAppView.swift
//  Level_Up
//
//  Created by Ilenia Munfuletto on 03/12/24.
//

import SwiftUI

struct OnboardAppView: View {
    @Binding var userPreferences: UserPreferences
    
    @State private var currentPage: Int = 0
    let uif = UIFunctions()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
        
    var body: some View {
        VStack{
            
            Text("Benvenuto in Level Up!")
                .bold()
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 30)
            
            RoundedRectangle(cornerRadius: 32)
                .fill(.black)
                .frame(width: 360, height: 480)
                .shadow(color: .accentColor, radius: 12, x: 0, y: 0)
                .overlay(
                    VStack{
                        TabView (selection: $currentPage) {
                            ForEach(0..<4, id:\.self){ index in
                                if index == 0{
                                    firstPage()
                                }else if index == 1{
                                    secondPage()
                                }else if index == 2{
                                    thirdPage()
                                } else {
                                    fourthPage(userPreferences: $userPreferences)
                                }
                            }}
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(width: 300, height: 450)
                        .preferredColorScheme(.dark)
                        
                        Spacer()
                        HStack(spacing: 8) {
                            ForEach(uif.visiblePages(totalPages: 4, currentPage: currentPage), id: \.self) { page in
                                Circle()
                                    .fill(page == currentPage ? .accentColor : Color.gray)
                                    .frame(width: 10, height: 10)
                                    .animation(.easeInOut, value: currentPage)
                            }
                        }
                        .padding()
                        
                    })
        }.frame(width: screenWidth, height: screenHeight)
            .background(Color(hex: 0x2b2b2b))
       
        
        
    }
        
}


// FIRST PAGE ✔

struct firstPage : View {
    @State var currentFrame = 0
    
    //Crea l'array di frame da animare
    var scroll : [String] = buildStringArray(prefix: "swipe-left-right-", count: 114, startWithZero: true)
    

    var animationDuration: Double = 5.0
    @State var animationTimer: Timer?
          
    var body: some View {
        VStack{
            
            Text("Esplora!")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 30)
            
            Image(scroll[currentFrame])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 270, height: 270)
                        .padding(.vertical,10)
                        .scaledToFit()
                        .onAppear {
                            startAnimation()
                        }
                        .onDisappear() {
                            stopAnimation()
                        }
            
            Text("Fai uno **SWIPE** per vedere tutti i giochi della tua saga preferita")
            
        }
        
    }
    
    
    
    private func startAnimation() {
           // Ferma il timer esistente, se presente
           animationTimer?.invalidate()

           // Calcola l'intervallo per ogni frame
           let frameInterval = animationDuration / Double(scroll.count)

           // Crea un nuovo timer per l'animazione
           animationTimer = Timer.scheduledTimer(withTimeInterval: frameInterval, repeats: true) { _ in
               currentFrame = (currentFrame + 1) % scroll.count
           }
       }
    
    
    
    
    private func stopAnimation() {
            // Ferma il timer e resetta lo stato
            animationTimer?.invalidate()
            animationTimer = nil
        }
}
    

// SECOND PAGE ✔

struct secondPage : View {
    @State var currentFrame = 0
    
    //Crea l'array di frame da animare
    var vSwipe : [String] = buildStringArray(prefix: "vswipe-", count: 95, startWithZero: true)
        

    var animationDuration: Double = 5.0
    @State var animationTimer: Timer?
          
    var body: some View {
        VStack{
            
            Text("Scopri!")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 30)
                
                Image(vSwipe[currentFrame])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 270)
                            .padding(.vertical,10)
                            .scaledToFit()
                            .onAppear {
                                startAnimation()
                            }
                            .onDisappear() {
                                stopAnimation()
                            }
            Text("Fai uno **SCROLL** per vedere tutti i film e libri correlati alla tua saga preferita")
            
        }
        
    }
    
    
    
    private func startAnimation() {
           // Ferma il timer esistente, se presente
           animationTimer?.invalidate()

           // Calcola l'intervallo per ogni frame
           let frameInterval = animationDuration / Double(vSwipe.count)

           // Crea un nuovo timer per l'animazione
           animationTimer = Timer.scheduledTimer(withTimeInterval: frameInterval, repeats: true) { _ in
               currentFrame = (currentFrame + 1) % vSwipe.count
           }
       }
    
    
    
    
    private func stopAnimation() {
            // Ferma il timer e resetta lo stato
            animationTimer?.invalidate()
            animationTimer = nil
        }
}


// THIRD PAGE ✔

struct thirdPage : View {
    @State var currentFrame = 0
    
    //Crea l'array di frame da animare
    var tap : [String]  = buildStringArray(prefix: "tap-", count: 122, startWithZero: true)
        

    var animationDuration: Double = 6.0
    @State var animationTimer: Timer?
          
    var body: some View {
        VStack{
            
            Text("Approfondisci!")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 30)
                
                Image(tap[currentFrame])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 270)
                            .padding(.vertical,10)
                            .scaledToFit()
                            .onAppear {
                                startAnimation()
                            }
                            .onDisappear() {
                                stopAnimation()
                            }
            Text("Fai uno **TAP** per vedere tutti i dettagli della tua saga preferita")
            
        }
        
    }
    
    
    
    private func startAnimation() {
           // Ferma il timer esistente, se presente
           animationTimer?.invalidate()

           // Calcola l'intervallo per ogni frame
           let frameInterval = animationDuration / Double(tap.count)

           // Crea un nuovo timer per l'animazione
           animationTimer = Timer.scheduledTimer(withTimeInterval: frameInterval, repeats: true) { _ in
               currentFrame = (currentFrame + 1) % tap.count
           }
       }
    
    
    
    
    private func stopAnimation() {
            // Ferma il timer e resetta lo stato
            animationTimer?.invalidate()
            animationTimer = nil
        }
    
    
 
}


struct fourthPage: View {
    @Binding var userPreferences: UserPreferences

    var body : some View {
        VStack {
            Text("Buon Divertimento!")
                .bold()
                .font(.title)
            Spacer()
            Image(ImageResource(name: "Logo", bundle: .main))
                .resizable()
                .frame(width: 220, height: 220)
            Spacer()
            Button(action: {
                userPreferences.firstTime = false
                storePreferences(userPrefs: userPreferences)
            }) {
                Text("Iniziamo!")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(.accent)
                    .cornerRadius(10)
            }
        }.padding(.vertical, 50)
    }
}



#Preview {
    OnboardAppView(userPreferences: .constant(UserPreferences(favouriteGames: [], firstTime: true)))
                        
}

