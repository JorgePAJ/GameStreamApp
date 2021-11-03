//
//  ContentView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 12/05/21.
//

//
//  ContentView.swift
//  GameStream
//
//  Created by Juan Villalvazo on 28/04/21.
//

import SwiftUI
import Parse


struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView{
         
            ZStack{
            
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 100).ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
               Image("AppLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 60.0)
         
                
                InicioYRegistroView()
                
            }
            
            }.navigationBarHidden(true)
            
        }
    
    
    
    
    
    }
}


struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion:Bool = true
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Button("INICIAR SESIÓN"){
                    
                    print("Pantalla Inicio sesion")
                    tipoInicioSesion = true
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE"){
                    
                    print("Pantalla Registro")
                    tipoInicioSesion = false
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            
            Spacer(minLength: 42)
            
            
            if(tipoInicioSesion){
                InicioSesiónView()
            }else{
                RegistroView()
            }
            
        }
        
    }
}

struct InicioSesiónView: View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var isPantallaHomeActive:Bool = false
    @State var ifNotUserFound = false
    
    var body: some View {
        
     
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                Text("Correo electrónico")
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                
                ZStack(alignment: .leading){
                    if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if contraseña.isEmpty { Text("Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $contraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300,  alignment: .trailing)
                    .foregroundColor(Color("Dark-Cyan"))
                    .padding(.bottom)
                
                Button(action: {iniciarSesion()},
                                                     label:
                                                     {
                                                          Text("Iniciar Sesión").fontWeight(.bold)
                                                              .foregroundColor(.white)
                                                              .frame(maxWidth: .infinity, alignment: .center)
                                                              .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                                              .overlay(RoundedRectangle(cornerRadius: 6.0)
                                                              .stroke(Color("Dark-Cyan"), lineWidth: 1.0)
                                                              .shadow(color: .white, radius: 6))
                                                     }).alert(isPresented: $ifNotUserFound, content:
                                                                  {
                                                                      Alert(title: Text("Error"), message: Text("Usuario o contraseña incorrecta"), dismissButton: .default(Text("Entendido")))
                                                                  }
                                                                       ).padding(.bottom)
                
                
                

                
                
                Text("Iniciar sesión con redes sociales").frame( maxWidth: .infinity,  alignment: .center).foregroundColor(.white)
                
                
                HStack {
                        
    
                        Button(action: {print("Inicio de sesión con Facebook")}) {
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }
                        
                        .padding()
                    
                    
                    
                    Button(action: {print("Inicio de sesión con Twitter")}) {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }.padding()
                    
                }
                
            }.padding(.horizontal, 42.0)
        
        
            //Destinos de navegación
            NavigationLink(
                destination: HomeView(),
                isActive: $isPantallaHomeActive,
                label: { EmptyView()
                })
        
        }
        

        
    }
    
    
    func iniciarSesion(){
        // Comienza el inicio de sesión
        print("Estoy iniciando sesión.")
        
        // Creación de instancias. En este caso la clase SaveData
        let objetoActualizadorDatos = SaveData()

        
//        let query = PFQuery(className: "Usuario")
//        query.getObjectInBackground(withId: "QCJ58IgOEc") {
//            (object, error) -> Void in
//            if object != nil && error == nil {
//                print(object)
//            }else{
//                print(error)
//            }
//        }
        let query = PFQuery(className: "Usuario")
        query.findObjectsInBackground(block: { (objects, error) -> Void in
            if error == nil{
                if let returnedObjects = objects{
                    for object in returnedObjects{
                        if object["correo"] as! String == self.correo && object["contrasena"] as! String == self.contraseña{
                            // Se activa la pantalla Home
                            ifNotUserFound = false
                            isPantallaHomeActive = true
                        }else{
                            ifNotUserFound = true
                        }
                    }
                }
            }
             
        })
    
    }
    
    
}

struct RegistroView: View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var confirmacionContraseña:String = ""
    @State var contraseñaIsNotConfirmed:Bool = false
    @State var isPantallaHomeActive:Bool = false
    
    var body: some View {
        
        
        ScrollView{
            
            
            VStack(alignment: .center){
               
                Text("Elije una foto de perfíl")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    
                
                Text("Puedes cambiar o elejirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
               
                
                
                Button(action: tomarFoto, label: {
                    ZStack{
                        
                        Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80.0, height: 80.0)
                        
                        Image(systemName: "camera").foregroundColor(.white)
       
                        
                    }
                })
                
                
               
                 
                    
                
            }.padding(.bottom, 18)
            
          
            
            VStack(alignment: .leading){
                
                
                VStack{
                
             
               
                    
                Text("Correo electrónico")
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                
                ZStack(alignment: .leading){
                    if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if contraseña.isEmpty { Text("Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $contraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                
                Text("Confirmar contraseña*").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if confirmacionContraseña.isEmpty { Text("Reintroduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $confirmacionContraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                    .padding(.bottom)
                 
                    
                }
               
                
                Button(action: {registrarse()},
                                       label:
                                       {
                                            Text("REGÍSTRATE").fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                                .overlay(RoundedRectangle(cornerRadius: 6.0)
                                                .stroke(Color("Dark-Cyan"), lineWidth: 1.0)
                                                .shadow(color: .white, radius: 6))
                                       }).alert(isPresented: $contraseñaIsNotConfirmed, content:
                                                    {
                                                        Alert(title: Text("Error"), message: Text("La contraseña no coincide. Confirma tu contraseña"), dismissButton: .default(Text("Entendido")))
                                                    }
                                                         )


                // Navegar a la pantalla Home
                        NavigationLink(destination: Home(), isActive: $isPantallaHomeActive, label: {EmptyView()}).padding(.bottom)
                
              
                        
                Text("Regístrate con redes sociales").frame( maxWidth: .infinity,  alignment: .center).foregroundColor(.white)
                
                
                HStack {
                        
    
                        Button(action: {print("Inicio de sesión con Facebook")}) {
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                                
                        }
                        
                        .padding()
                    
                    
                    
                    Button(action: {print("Inicio de sesión con Twitter")}) {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }.padding()
                    
                }
                
            }.padding(.horizontal, 42.0)
            
    
       }
        

    }

    
    func tomarFoto()  {
        print("Tomo foto")
        //logica de tomar fotos.
    }
    
    func registrarse(){
        // Confirmar que la contraseña haya sido escrita correctamente
        if contraseña != confirmacionContraseña
        {
            contraseñaIsNotConfirmed = true
        }else
        {
            // Contraseña confirmada. No se muestra la alerta.
            contraseñaIsNotConfirmed = false
            
            // Objeto de la clase SavData.
            let objetoActualizadorDatos = SaveData()
            // Registro que no requiere nombre.
            let resultado = objetoActualizadorDatos.registrar(correo: self.correo, contraseña: self.contraseña)
            
            // Activar la pantalla home
            var usuario = PFObject(className: "Usuario")
            usuario["correo"] = self.correo
            usuario["contrasena"] = self.contraseña
            usuario.saveInBackground {
              (success: Bool, error: Error?) in
              if (success) {
                // The object has been saved.
                  print("se guardaron los datos en back4app")
              } else {
                // There was a problem, check error.description
                  print("No se guardaron los datos en back4app")
              }
            }
            
            print("Se guardaron los datos con exito?: \(resultado)")
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
     
        Group {
            ContentView()
            InicioSesiónView().background(Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 100).ignoresSafeArea())
        }
        
    }
}


/*Branches
 //1.- Branch 01 (modulosPyramidOfDoom): UI de primer parte de la pantalla de iniciar sesion (Imagen logo + botones "Iniciar sesion" y "Registro" )
 
 //2.- Branch 02 (pantallaInicioSesion): UI de pantalla de Inicio de Sesión completa
 
 //3.- Branch 03 (pantallaRegistro): UI de pantalla de Inicio de Registro completa
 
 //4.- Branch 04 (PantallaHome): UI de pantalla Home
 
 
 //5.- Branch 05 (IntroduccionMVVM) : Añadidos archivos Model.swift - ViewModel.swift, implementacion de recuperacion de datos json.
 
 
 */
}
