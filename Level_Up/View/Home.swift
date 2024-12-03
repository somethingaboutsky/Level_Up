//
//  Home.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct Home: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let img_logo = ImageResource(name: "ACLogo", bundle: .main)
    
    @State private var currentGame = 0
    @Binding var gameSeries: GameSeries
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top) {
                HStack {
                    Spacer()
                    Image(ImageResource(name: gameSeries.seriesImage, bundle: Bundle.main))
                        .resizable()
                        .frame(width: 64, height: 64)
                    Spacer()
                }
                .background(.black)
                .zIndex(1)
                
                VStack(spacing: 0) {
                    ScrollView(.vertical) {
                        VStack (spacing: 0) {
                            // Game series carousel
                            GameCarousel(games: $gameSeries.games)
                            // Related Media Carousels
                            if gameSeries.films.count > 0 {
                                MoviesCarousel(films: $gameSeries.films)
                            }
                            /*if gameSeries.tvShows.count > 0 {
                                TVShowsCarousel()
                            }*/
                            if gameSeries.books.count > 0 {
                                BooksCarousel(bookCollection: $gameSeries.books)
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
            }
        }
        .preferredColorScheme(.dark)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(img_logo)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .padding(.vertical, 10)
            }
            
        }
    }
}

#Preview {
    Home(gameSeries: .constant(GameSeries(
        name: "Assassin's Creed", seriesImage: "ACLogo", desc: "An iconic series exploring the eternal struggle between Assassins and Templars through history.", games: [Game(id: 0, title: "Assassin's Creed", cover: "Assassins_Creed_1", story: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac risus nunc. Sed sodales lacus ac metus lobortis maximus. Praesent a diam blandit purus interdum commodo. Nullam ut augue tempor, sodales nisi ac, commodo metus. Nunc venenatis, odio auctor luctus tempor, massa ante gravida nisl, in egestas diam leo ut urna. Cras quis elit tempus, blandit diam eget, mollis ipsum. Quisque vestibulum lorem odio, aliquet dictum neque tincidunt sed. Phasellus dignissim mattis tellus. Nulla ac dapibus neque. Nulla rhoncus nulla at turpis volutpat, a eleifend sapien pellentesque. In porttitor, nulla nec sodales pretium, diam arcu auctor tellus, quis hendrerit mauris sem non lorem.\n\nVivamus dapibus risus sit amet lacus bibendum ullamcorper. Mauris dictum nisi porttitor nibh mollis facilisis. Nam sollicitudin faucibus laoreet. In purus quam, cursus in ex eu, maximus porta nibh. Ut finibus vestibulum quam vel scelerisque. Phasellus posuere vel nunc vel dictum. Ut volutpat non libero in suscipit. Donec vitae scelerisque arcu. Nulla quis arcu pulvinar, rutrum lacus id, ultricies orci. Vestibulum pellentesque, nibh at maximus mollis, ipsum dui molestie turpis, id tempus quam magna ac ex. Proin velit dolor, ornare eget finibus non, convallis et est. Duis vitae massa porttitor, aliquet ligula sed, vestibulum lacus. Mauris suscipit ullamcorper lacus, in tincidunt justo porttitor in. Aliquam suscipit, mauris sit amet tristique commodo, metus sapien consectetur enim, eget maximus nulla lacus ac erat.\n\nProin non felis pellentesque, blandit nulla ac, vehicula risus. Pellentesque vel tincidunt neque, sit amet tempor massa. Curabitur fermentum rutrum nunc, ac efficitur justo sodales at. Sed sed porttitor magna. Vestibulum sed lectus sed ligula scelerisque vehicula ac non tortor. Vestibulum eget ex facilisis mauris elementum efficitur quis non elit. Aliquam erat volutpat. Quisque at dolor accumsan, sodales urna ut, sagittis ex. Vestibulum ut tempus enim.\n\nEtiam congue vulputate ultrices. Etiam ac diam ligula. Morbi eros lorem, finibus sed cursus id, cursus vitae quam. Donec volutpat, nisi et sagittis sodales, ante nibh iaculis enim, et aliquet lorem nunc eu urna. In ut purus in nulla commodo fringilla nec id erat. Donec suscipit accumsan ligula in aliquam. Sed hendrerit leo dolor, sit amet condimentum nunc viverra eu. Maecenas sem risus, blandit et mauris nec, tincidunt accumsan nibh. Fusce quis elit at felis feugiat ullamcorper.\n\nCurabitur id tincidunt libero, ac tempus massa. Praesent blandit lectus sed leo iaculis consectetur. Maecenas cursus, metus luctus cursus varius, nisi ligula pellentesque dui, eget efficitur diam diam ut enim. Phasellus aliquam finibus dolor, id porta orci dapibus a. Nunc lobortis laoreet risus quis suscipit. Sed quis faucibus erat, quis egestas lectus. Pellentesque lobortis felis nec turpis convallis, nec ullamcorper quam eleifend. Sed tortor lorem, luctus non semper ut, aliquam non magna. Curabitur luctus quis neque nec porttitor. Nullam vel enim at mauris finibus maximus sit amet molestie odio.", releaseYear: 2007, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: [Characters(name: "Altair", characterImage: "Altair", desc: "Altair è bello e bravo"), Characters(name: "Al Mualim", characterImage: "Al_Mualim_ACR", desc: "Al Mualim è brutto e cattivo")]), Game(id: 1, title: "Assassin's Creed 2", cover: "Assassins_Creed_2", story: "Sparagli Piero, sparagli adesso, prima che lui faccia lo stesso", releaseYear: 2009, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: [])], books: [Book(id: 0, title: "The Secret Crusade", cover: "the_secret_crusade", releaseYear: 2007, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit.")], films: [Movie(id: 0, title: "Assassin's Creed", cover: "ac_movie", releaseYear: 2016, synopsys: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend nisl nec magna dignissim tempor. In efficitur vel nisl nec semper. Suspendisse potenti. Suspendisse accumsan mauris ac nunc varius, et venenatis nunc congue. Maecenas mattis rhoncus neque et ultricies. Donec efficitur hendrerit est nec euismod. In hac habitasse platea dictumst. Donec ut tempus diam, a pretium tellus. Phasellus id nisi in nisi sollicitudin semper eget sed enim. Proin quis finibus elit.")])))
}
