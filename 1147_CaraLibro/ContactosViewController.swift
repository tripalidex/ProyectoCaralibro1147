//
//  ContactosViewController.swift
//  1147_CaraLibro
//
//  Created by Carlos Martin Quispe Bartolo on 10/07/22.
//

import UIKit
import Firebase

class ContactosViewController: UIViewController {
    
    @IBOutlet private weak var tlvContactos: UITableView!
    @Published var list = [contactos]()
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tlvContactos.dataSource = self
        
        getData()
    }
    
    
    func getData() {
            
            // Get a reference to the database
           
            
            // Read the documents at a specific path
            db.collection("contactos").getDocuments() { snapshot, error in
                
                // Check for errors
                if error == nil {
                    // No errors
                    
                    if let snapshot = snapshot {
                        
                        // Update the list property in the main thread
                        DispatchQueue.main.async {
                            
                            // Get all the documents and create Todos
                            self.list = snapshot.documents.map { d in
                                
                                // Create a Todo item for each document returned
                                return contactos(id: d["id"] as? String ?? "", email: d["email"] as? String ?? "",
                                                 nombres: d["nombres"] as? String ?? "",
                                                 apellidos: d["apellidos"] as? String ?? "")
                            }
                        }
                        
                        
                    }
                }
                else {
                    // Handle the error
                }
            }
        }
}

extension ContactosViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
 
}
