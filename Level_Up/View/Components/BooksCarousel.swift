//
//  BooksCarousel.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct BooksCarousel: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let totalPages = 15
    
    let uif = UIFunctions()
    
    @State private var currentPage: Int = 0
    @Binding var bookCollection: [Book]
    
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                Text("Libri Correlati")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.top, 70)
                Spacer()
            }
            .padding(.leading, 10)
            
            
            TabView (selection: $currentPage) {
                ForEach($bookCollection, id: \.id) { book in
                    NavigationLink(destination: BookDetailView(book: book)){
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0))
                            .frame(width: 360, height: 600)
                            .overlay(VStack(alignment: .center) {
                                Image(ImageResource(name: book.cover.wrappedValue, bundle: Bundle.main))
                                    .resizable()
                                    .frame(width: 300, height: 420)
                                    .cornerRadius(12)
                                    .shadow(color: .accentColor, radius: 12, x: 0, y: 0)
                                    
                                Text(book.title.wrappedValue)
                                    .font(.system(size: 36, weight: .semibold))
                                    .padding(.top, 15)
                                    .padding(.bottom, 10)
                                Text(String(book.releaseYear.wrappedValue))
                                    .font(.system(size: 22, weight: .light))
                            })
                            .frame(maxWidth: .infinity)
                            .frame(alignment: .center)
                            .padding(.horizontal, 10)
                    }.foregroundColor(.white)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: currentPage) { _ in
                // Trigger haptic feedback
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }
            
            // Custom page control
            HStack(spacing: 8) {
                ForEach(uif.visiblePages(totalPages: bookCollection.count, currentPage: currentPage), id: \.self) { page in
                    Circle()
                        .fill(page == currentPage ? .accent : Color.gray)
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            .padding()
        }
        .frame(width: screenWidth, height: screenHeight - 80)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    BooksCarousel(bookCollection: .constant([Book(id: 0, title: "The Secret Crusade", cover: "the_secret_crusade", releaseYear: 2007, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit."), Book(id: 1, title: "Renaissance", cover: "Renaissance", releaseYear: 2009, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit."), Book(id: 2, title: "Unity", cover: "unity", releaseYear: 2015, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit.")]))
}

