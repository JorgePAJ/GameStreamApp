//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 21/10/21.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
        
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        
        
        
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                            juego in
                            
                            Button(action: {
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                description = juego.description
                                tags = juego.tags
                                imgsUrl = juego.galleryImages
                                
                                print("Pulse el juego \(titulo)")
                            }) {
                                
                                
                                Text("\(juego.title)")
                            }
                        }
                        
                    }
                    
                    
                }
            }
            .padding(.horizontal,6)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("Primer elemento del JSON: \(todosLosVideojuegos.gamesInfo[0])")
            print("Titutlo del primer videojuego del JSON: \(todosLosVideojuegos.gamesInfo[0].title)")
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
