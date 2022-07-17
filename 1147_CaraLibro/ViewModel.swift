//
//  ViewModel.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 17/07/22.
//

import Foundation
import Firebase

class ViewModel: ObservableObject{
     @Published var list = [contactos]()
    func getData() {
        let db = Firestore.firestore()
        db.collection("users").getDocuments{snapshot, error in
                                            if error == nil {
            if let snapshot = snapshot {
                snapshot.documents.map {
                    d in
                    return contactos(id: d.documentID,
                                     email: d["email"] as? String ?? "",
                                     nombres: d["nombres"] as? String ?? "",
                                     apellidos: d["apellidos"] as? String ?? "")
                }
            }
        }
        }
    }
}
