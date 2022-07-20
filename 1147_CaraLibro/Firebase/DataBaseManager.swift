//
//  DataBaseManager.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 20/07/22.
//

import Foundation
import FirebaseDatabase
typealias JSON = [String:Any]


class DataBaseManager{
    
    static let shared = DataBaseManager()
    
    private var ref:DatabaseReference!
    
    public func  getdatos(DBnombre:String,heder:String = "",parametros:String = "",completado:@escaping(_ respuesta:JSON)->Void){
        ref = Database.database().reference().child(DBnombre)
        ref.observe(DataEventType.value){ (snapshot) in
            if snapshot.childrenCount > 0 {
                for any in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    guard let json = any.value as? JSON else {
                     return
                    }
                    if parametros == "" {
                        completado(json)
                    }else if json[heder] as! String == parametros {
                        completado(json)
                    }
                }
            }
        }
    }
}
