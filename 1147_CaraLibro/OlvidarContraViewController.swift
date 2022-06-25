//
//  OlvidarContraViewController.swift
//  1147_CaraLibro
//
//  Created by Carlos Martin Quispe Bartolo on 14/05/22.
//

import UIKit

class OlvidarContraViewController: UIViewController {
    
    @IBAction private func tapTopCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
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
