//
//  DetallesRegisterViewController.swift
//  1147_CaraLibro
//
//  Created by Claudia Postigo Rios on 16/07/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class DetallesRegisterViewController: UIViewController {
    @IBOutlet var registerNombre: UITextField!
    
    @IBOutlet var registerApellido: UITextField!
    
    @IBOutlet var registerImagen: UIImageView!
    
    @IBOutlet var registerbtnImagen: UIButton!
    
    @IBAction func selecionarFoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func addData(email: String, nombres: String , apellidos: String) {
            
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Add a document to a collection
        db.collection("users").addDocument(data: ["email":email, "nombres":nombres, "apellidos":apellidos]) { error in
                
                // Check for errors
                if error == nil {
                    // No errors
                    
                    // Call get data to retrieve latest data
                    //self.getData()
                    
                }
                else {
                    // Handle the error
                }
            }
        }
    
}
extension DetallesRegisterViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagen = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            registerImagen.image = imagen
        }
        
        picker.dismiss(animated: true , completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true , completion: nil)
        
    }
}
