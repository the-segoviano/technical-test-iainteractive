//
//  Alert.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Strings.ok, style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    static func showIncompleteFormAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Woops", message: "Please enter all information to log in.")
    }
    
    static func showIncompleteFormSignUpAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Woops", message: "Please enter all information to create a new account.")
    }
    
    static func showInvalidEmailAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Email", message: "Please use a correct email.")
    }
    
    static func showInvalidPassword(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Password", message: "Use at least 6 characters.")
    }
    
    static func showInvalidPasswordConfirmation(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Password", message: "The passwords fields must match.")
    }
    
    static func showUnableToRetrieveDataAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Unable to Retrieve Data", message: "Please try again.")
    }
    
    static func UseralreadyExistsAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "User already exists", message: "Please try with different email.")
    }
    
    static func showRecoveryEmailSentAlert(context: UIViewController, success: ((UIAlertAction) -> Void)?)
    {
        let alertController = UIAlertController(title: "Correo enviado",
                                                message: "Te hemos enviado una contraseña provisional con la que podrás entrar a la aplicación.",
                                                preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: Constants.Strings.accept,
                                          style: UIAlertAction.Style.default,
                                          handler: success)
        alertController.addAction(dismissAction)
        DispatchQueue.main.async { context.present(alertController, animated: true, completion: nil) }
    }
    
    static func showSomethingGetsWrongAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Parece que hubo un problema",
                       message: "Perdón, parece que algo salió mal, ¿Intentamos de nuevo?.")
    }
    
    static func showAddressDeletionConfirmationAlert(on vc: UIViewController,
                                                     yesAction: ((UIAlertAction) -> Void)?
    ) {
        let alertController = UIAlertController(title: Constants.Strings.eliminar,
                                                message: "¿Seguro que quieres eliminar esta direeción? ",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Si", style: .default, handler: yesAction))
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        DispatchQueue.main.async { vc.present(alertController, animated: true, completion: nil) }
    }
    
    static func showAddressDeletedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Operacion Exitosa",
                       message: "Su dirección fue dada de baja.")
    }
    
    static func showCardDeletionConfirmationAlert(on vc: UIViewController,
                                                     yesAction: ((UIAlertAction) -> Void)?
    ) {
        let alertController = UIAlertController(title: Constants.Strings.eliminar,
                                                message: "¿Seguro que desea eliminar esta Tarjeta? ",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Si", style: .default, handler: yesAction))
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        DispatchQueue.main.async { vc.present(alertController, animated: true, completion: nil) }
    }
    
    static func showCardDeletedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Operacion realizada con éxito", message: "Su tarjeta fue dada de baja.")
    }
    
    
    static func showErrorToSaveAddressAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Parece que hubo un problema",
                       message: "Perdón, parece que no te pudimos registrar, intentalo de nuevo.")
    }
    
    static func showAddressSavedAlert(context: UIViewController, success: ((UIAlertAction) -> Void)?)
    {
        let alertController = UIAlertController(title: "Direccion Registrada",
                                                message: "Tu nueva dirección se guardó correctamente",
                                                preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: Constants.Strings.ok,
                                          style: UIAlertAction.Style.default,
                                          handler: success)
        alertController.addAction(dismissAction)
        DispatchQueue.main.async { context.present(alertController, animated: true, completion: nil) }
    }
    
    
    static func showIncorrectCardNumberLengthAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Parece que hubo un problema", message: "Verifique por favor el numero de su tarjeta.")
    }
    
    
    static func showIncorrectCVVNumberLengthAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Parece que hubo un problema", message: "Verifique por favor su numero CVV.")
    }
    
    
    static func showWrongExpirationDateFormatAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Parece que hubo un problema",
                       message: "Asegurese que su tarjeta sea vigente o verifique nuevamente la fecha de expiración.")
    }
    
    
    static func showCardRejectedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Su tarjeta fue rechazada", message: "Intente más tarde o pongase en contacto con su banco.")
    }
    
    
}
