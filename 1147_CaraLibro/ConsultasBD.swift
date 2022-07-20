//
//  ConsultasBD.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 20/07/22.
//

import Foundation
import Firebase
import FirebaseAuth

class ConsultaDB
{
    class func getContactos(success:@escaping listContactos, error: @escaping MensajeError){
        DataBaseManager.shared.getdatos(DBnombre: "contactos") { respuesta in
            RespuestaGenerica.Respuesta(respuestaFirebase: respuesta) { json in
                let contactoInfo = contactosBE.parse(json)
                success(contactoInfo)
            } error: { mensaje in
                error(mensaje)
            }
        }
    }
}
