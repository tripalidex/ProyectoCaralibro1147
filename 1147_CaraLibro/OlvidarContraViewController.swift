//
//  OlvidarContraViewController.swift
//  1147_CaraLibro
//
//  Created by Carlos Martin Quispe Bartolo on 14/05/22.
//

import UIKit
import FirebaseAuth

class OlvidarContraViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction private func tapTopCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
        
    @IBAction func forgotPassButton_Tapped(_ sender: Any){
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if let error = error {
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
                self.present(alertController, animated: true, completion: nil)
            }
            let alertController = UIAlertController(title: "Correo enviado", message: "El correo de verificación se envió correctamente, revisa tu apartado de spam!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("OlvidarContraViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("OlvidarContraViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("OlvidarContraViewController - viewDidDisappear")
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
    
}
