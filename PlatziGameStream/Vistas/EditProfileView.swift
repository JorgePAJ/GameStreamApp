//
//  EditProfileView.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 03/11/21.
//

import SwiftUI


struct EditProfileView: View {
    @State var imagenPerfil:Image? = Image("perfilEjemplo")
    @State var isCameraActive = false
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {

                    Text("Editar Perfil")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    
                    
                    Button(action: {isCameraActive = true  }, label: {
                        
                        ZStack {
                            
                            imagenPerfil!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive, content: {
                                    SUImagePickerView(sourceType: .photoLibrary, image: self.$imagenPerfil, isPresented: $isCameraActive)
                                })
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                        }
                        
                    })


                }.padding(.bottom,18)
            
                ModuloEditar()
                
            }
        }
    }
}

struct ModuloEditar: View{
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var nombre:String = ""
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cyan"))
            
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .accentColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                TextField("", text: $correo)
                    .foregroundColor(.white)
                
                
                
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom,8)
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                if contraseña.isEmpty{
                    Text("Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                SecureField("", text: $contraseña)
                    .foregroundColor(.white)
                
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                .padding(.bottom,8)

            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                if nombre.isEmpty{
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                TextField("", text: $nombre)
                    .foregroundColor(.white)
                
            }

            Divider()
                .frame(height: 1)
                .background(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                .padding(.bottom, 32)
            
            Button(action: {actualizarDatos()}, label: {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame( maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("Dark-Cyan"), lineWidth: 3).shadow(color: .white, radius: 6))
            })
            
            
        }.padding(.horizontal,42.0)
        
    }
    
    func actualizarDatos(){
        
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        
        print("Se guardaron los datos con exito? \(resultado)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

