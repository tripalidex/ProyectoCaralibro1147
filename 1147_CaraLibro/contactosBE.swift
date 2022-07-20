//
//  contactosBE.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 20/07/22.
//

import Foundation

class contactosBE{
    var id = 1
    var email = ""
    var nombres = ""
    var apellidos = ""
    
    public class func parse(_ json:JSON)-> contactosBE{
        let objBE = contactosBE()
        
        objBE.id = json["id"] as? Int ?? 1
        objBE.nombres = json["nombres"] as? String ?? ""
        objBE.email = json["email"] as? String ?? ""
        objBE.apellidos = json["apellidos"] as? String ?? ""
        return objBE
    }
}
