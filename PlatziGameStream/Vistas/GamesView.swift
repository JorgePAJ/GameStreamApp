//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 21/10/21.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    var body: some View {
        Text("Hola desde pantalla GamesView")
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
