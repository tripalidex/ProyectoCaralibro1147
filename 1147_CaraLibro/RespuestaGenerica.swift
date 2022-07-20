//
//  RespuestaGenerica.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 20/07/22.
//

import Foundation

class RespuestaGenerica {
    
    class func Respuesta (respuestaFirebase:JSON,success:(_ json:JSON)->Void, error:MensajeError){
        if respuestaFirebase != nil {
            success(respuestaFirebase)
        }else { error("Error: No hay respuesta")}
    }
}
