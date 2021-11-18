//
//  ViewController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 17/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Here is where everything start!"
        label.textAlignment = .center
        self.view.addSubview(label)
        label.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    
}




extension UIViewController {
    /**
     * Funciones para ocultar el keyword cuando se toca en cualquier region de la pantalla
     *
     */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
        
}






