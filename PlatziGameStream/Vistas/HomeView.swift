//
//  HomeView.swift
//  PlatziGameStream
//
//

import SwiftUI
import AVKit

struct HomeView: View {
   
  
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        
               
                TabView(selection:$tabSeleccionado) {
                   
                    
                    
                    Text("Perfil")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person")
                            Text("Perfil")
                        }.tag(0)
                        
                 
                    Text("Juegos")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "gamecontroller")
                            Text("Juegos")
                        }.tag(1)
                    
                    
                    Home().tabItem {
                        Image(systemName: "house")
                        Text("Inicio")
                    }.tag(2)
                    
                    
                   
                    
                   
                    Text("Favoritos")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favoritos")
                        }.tag(3)
                    
                 
                 
                    
                 
                   
                }
                .accentColor(.white)
                
                
                
                
                
     
         
    }
    
    
    init() {
        
        UITabBar.appearance().barTintColor = UIColor (Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("popular vistas")
    }
    
    
   
}


//Puede llamarse Home o PantallaHome, siempre y cuando describa la estructura y su motivo de ser.
struct Home:View {
    
   
    
    @State var textoBusqueda = ""
    
    var body: some View{
    

        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Image("AppLogo").resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 250)
                     .padding(.horizontal, 11.0)
                HStack{
                    Button(action: buscar) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(textoBusqueda.isEmpty ? Color(.white) : Color("Dark-Cyan"))
                    }
                    ZStack(alignment: .leading){
                        if textoBusqueda.isEmpty{
                            Text("Buscar un video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                        }
                        TextField("",text: $textoBusqueda)
                            .foregroundColor(.white)
                    }
                }
                .padding([.top,.leading,.bottom],11)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
                
            }.padding(.horizontal, 18.0)
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
 
        
    }
    
    func buscar() {
        print("Buscando video que contenga \(textoBusqueda)")
    }
    
//    func navegarVideoPLayerView(videoUrl:String){
//
//
//
//
//    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
