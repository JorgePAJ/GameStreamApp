//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 21/10/21.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla GamesView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                print("Primer elemento del JSON: ")
                print("Titutlo del primer videojuego del JSON: ")
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
