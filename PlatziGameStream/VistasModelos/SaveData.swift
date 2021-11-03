//
//  SaveData.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 03/11/21.
//

import Foundation

class SaveData{
    
    var correo:String = ""
    var contraseña:String = ""
    var nombre:String = ""
    
    
    func registrar(correo:String, contraseña:String) ->Bool{
        UserDefaults.standard.set([correo,contraseña], forKey: "datosUsuario")
        return true
    }
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) -> Bool{
        print("Dentro de la funcion guardarDatos obtuve:d \(correo) + \(contraseña) + \(nombre)")
        
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosUsuario")
        return true
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        print("Estoy en el metodo recuperarDatos y recupere: \(datosUsuario)")
        return datosUsuario
    }
    
    func validar(correo:String, contraseña:String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("Revisando si tengo datos en UserDefaults con el correo \(correo) y la contraseña \(contraseña)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            print("El correo guardado es \(correoGuardado) y la contraseña guardad es \(contraseñaGuardada)")
            
            if(correo == correoGuardado && contraseña == contraseñaGuardada){
                return true
            }else{
                return false
            }
        }else{
            print("No hay datos de usuario guardados en el UserDefault")
            return false
        }
    }
}
