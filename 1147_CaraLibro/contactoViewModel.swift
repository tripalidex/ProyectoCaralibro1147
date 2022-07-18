//
//  contactoViewModel.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 17/07/22.
//


import Foundation
import FirebaseFirestore
 
class contactoViewModel: ObservableObject {
     
    @Published var contacto = [contactos]()
    
     
    private var db = Firestore.firestore()
     
    func fetchData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
             
            self.contacto = documents.map { (queryDocumentSnapshot) -> contactos in
                let data = queryDocumentSnapshot.data()
                let email = data["email"] as? String ?? ""
                let nombres = data["nombres"] as? String ?? ""
                let apellidos = data["apellidos"] as? String ?? ""
                return contactos(email: email, nombres: nombres, apellidos: apellidos)
            }
        }
    }
}
