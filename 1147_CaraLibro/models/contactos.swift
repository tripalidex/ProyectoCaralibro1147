//
//  contactos.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 17/07/22.
//

import Foundation

struct contactos: Identifiable{
    var id: String = UUID().uuidString
    var email: String
    var nombres: String
    var apellidos: String
}

