//
//  ProfileView.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 03/11/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100,maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack{
                    Image("perfilEjemplo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                 
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100,maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,18)
                ModuloAjustes()
                
                Spacer()
            }
            
        }.onAppear {
            print("Revisando si tengo datos de usuario en mis usersDefaults")
        }
    }
}


struct ModuloAjustes: View{
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
    
        
        VStack(spacing: 3){
        
            Button(action: {}, label: {
                HStack{
                    
                
                Text("Cuenta")
                    .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                }.padding()})
                .background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
                
            Button(action: {}, label: {
                HStack{
                    
                
                Text("Notificaciones")
                    .foregroundColor(.white)
            Spacer()
                    Toggle("",isOn: $isToggleOn)

                }.padding()})
                .background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
           
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack{
                    
                
                Text("Editar Perfil")
                    .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                }.padding()})
                .background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {}, label: {
                HStack{
                    
                
                Text("Califica esta aplicación")
                    .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                }.padding()})
                .background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            NavigationLink(isActive: $isEditProfileViewActive, destination: {EditProfileView()}, label: {EmptyView()})
        }
    
    
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
