//
//  RegistrarViewController.swift
//  1147_CaraLibro
//
//  Created by Carlos Martin Quispe Bartolo on 14/05/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegistrarViewController: UIViewController {
    
    @IBOutlet var registerEmail: UITextField!
    
    @IBOutlet var registerPassword: UITextField!
    
    @IBOutlet var registerNombre: UITextField!
    
    @IBOutlet var registerApellido: UITextField!
    
    @IBOutlet var registerImagen: UIImageView!
    
    @IBOutlet var registerbtnImagen: UIButton!
    
    @IBOutlet var btnRegister: UIButton!
    
    
    @IBAction private func tapTopCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegistrarViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("RegistrarViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("RegistrarViewController - viewDidDisappear")
    }
    
    private func registerKeyboardNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillhide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    private func unregisterKeyboardNotifications (){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        print("TECLADO APARECE")
    }
    
    @objc private func keyboardWillhide(_ notification: Notification){
        print("TECLADO DESAPARECE")
    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        if let email = registerEmail.text, let password = registerPassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let result = result, error == nil {
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error",
                                                            message: "Se ha producido un error iniciando sesión", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
