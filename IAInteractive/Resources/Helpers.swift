//
//  Helpers.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var mainView: UIView {
        get {
            return self.view
        }
    }
    
    let localStorage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    @objc func close() {
        self.dismiss(animated: true)
    }
    
}

struct Constants {
    
    struct Strings {
        static let ok = "OK"
        static let accept = "Accept"
        static let cancel = "Cancel"
        static let email = "Correo electrónico"
        static let password = "Password"
        static let passwordConfirmation = "Password Confirmation"
        static let firstName = "First Name"
        static let lastName = "Last Name"
        static let loginTitle = "Login"
        static let login = "Log In"
        static let register = "Register"
        static let createAccount = "Create account"
        static let profilePicture = "Profile Picture"
        static let howSelectPicture = "How would you like to select a picture?"
        static let takePhoto = "Take Photo"
        static let chosePhoto = "Chose Photo"
        // Desde App anterior
        static let titleApp = "IA Interactive"
        static let lista = "Lista"
        static let pagar = "Pagar"
        static let subTotal = "Subtotal"
        static let iniciarSesion = "Iniciar Sesión"
        static let registrateAqui = "Registrate aquí  "
        static let nombre = "Nombre*"
        static let apellidos = "Apellidos*"
        static let correoElectronico = "Correo electrónico*"
        static let contrasena = "Contraseña*"
        static let confirmarContrasena = "Confirmar contraseña*"
        static let registro = "Registro"
        static let registrarme = "Registrarme"
        static let opcionesPago = "Opciones de Pago"
        static let pago = "Pagar"
        static let pagoProcesadoConExito = "El pago se ha procesado con exito!"
        static let cerrar = "Cerrar"
        static let cantidad = "Cantidad"
        static let cancelar = "Cancelar"
        static let eliminarArticulo = "Eliminar Articulo"
        static let eliminar = "Eliminar"
        static let seguroContinuar = "¿Esta seguro de continuar?"
        static let atras = "Atras"
        static let aceptar = "Aceptar"
        static let articulosSugeridos = "Artículos sugeridos"
        static let numeroDeTarjeta = "Número de tarjeta"
        static let olvideContrasena = "Olvidé mi contraseña  "
        static let agregarTarjeta = "Agregar tarjeta"
        static let siguiente = "Siguiente"
        static let recoverPasswordText = "Ingresa tu correo electrónico para recuperar tu contraseña."
        static let recoverPassword = "Recuperar contraseña"
        static let update = "Actualizar"
        static let updatePassword = "Cambiar contraseña"
        static let currentPassword = "Contraseña actual"
        static let newPassword = "Nueva contraseña"
        static let confirmNewPassword = "Confirmar nueva contraseña"
        static let save = "Guardar"
        static let emptyAddressesTitle = "Sin direcciones"
        static let emptyAddressesMessage = "Registra una para listarla en esta sección"
        static let emptyCardsTitle = "No tienes tarjetas de pago :("
        static let emptyCardsMessage = "Agrega una para poderte realizar tus compras."
        
        static let addressName = "Etiqueta tu dirección: ej. Mi Casa, El Trabajo, Casa de mi ex ..."
        static let street = "Calle"
        static let noInt = "No. Int"
        static let noExt = "No. Ext"
        static let guideZipcode = "Proporciona tu código postal \n y a continuación selecciona tu colonia"
        static let zipcode = "Código postal"
        static let neighborhood = "Tu colonia"
        static let city = "Ciudad"
        static let state = "Estado"
        static let nameAddress = "Nombre de tu nueva dirección"
        static let yourAddress = "Dirección"
        
    }
    
    
    struct Value {
        static let htTextField: CGFloat = 48.0
        static let htButton: CGFloat = 45.0
        static let leadingMar: CGFloat = 16.0  // Or Left Margin
        static let trailingMar: CGFloat = -16.0 // Or Right Margin
        static let padding: CGFloat = 8.0
        static let cornerRadius: CGFloat = 15.0
        static let heightLogo: CGFloat = 90.0
        static let widthLogo: CGFloat = 90.0
        static let logginPadding: CGFloat = 16.0
    }
    
    struct UserDefaultsKey {
        static let USER_ID: String = "USER_ID"
    }
    
    
    struct ImageName {
        static let logo: String = "logo"
        static let genericAvatar: String = "generic-avatar"
        
    }
    
    struct IdForCell {
        static let genericCell: String = "GenericCell"
        static let AvatarCell: String   = "AvatarCell"
        static let customHeader = "CustomHeader"
        static let footerCollectionViewCell: String = "FooterCollectionViewCell"
        
    }
    
}




class CustomTextField {
    
    class func getTextField(withPlaceholder placeholder: String = "") -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.cornerRadius = Constants.Value.cornerRadius
        field.addBorder(borderColor: UIColor.lightGray, widthBorder: 1.0)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.placeholder = placeholder
        if #available(iOS 13.0, *) {
            field.backgroundColor = .secondarySystemBackground
        } else {
            // Fallback on earlier versions
        }
        field.font = CustomFont.getRegularFont()
        return field
    }
    
}

class CustomTextFieldPassword: UITextField {
    
    let openEye: String   = "ic_show"
    
    let closedEye: String = "ic_hide"
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        button.setImage(UIImage(named: closedEye), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView = showPasswordButton
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.layer.cornerRadius = Constants.Value.cornerRadius
        self.addBorder(borderColor: UIColor.lightGray, widthBorder: 1.0)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftViewMode = .always
        if #available(iOS 13.0, *) {
            self.backgroundColor = .secondarySystemBackground
        } else {
            self.backgroundColor = .white
        }
        self.font = CustomFont.getRegularFont()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showPassword() {
        self.isSecureTextEntry = !self.isSecureTextEntry
        if self.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(named: closedEye), for: .normal)
        }
        else{
            showPasswordButton.setImage(UIImage(named: openEye), for: .normal)
        }
    }
    
}




extension UIColor {
    
    static let greenCustomized = ParseColor.hexStringToUIColor(hex: "#21b384")
    
    static let mercury = ParseColor.hexStringToUIColor(hex: "#f3f3f3")
    
}

class ParseColor {
    /**
     * Metodo para crear un color a partir de un hexadecimal en String
     *
     * @param hex String que se convertira a UIColor
     * @return UIColor
     */
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}



extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
}


class BaseButton {
    
    class func loginButton() -> UIButton {
        let button = BaseButton.getButton(withTitle: Constants.Strings.login, withColor: .systemBlue)
        return button
    }
    
    class func signUpButton() -> UIButton {
        let button = BaseButton.getButton(withTitle: Constants.Strings.register, withColor: .systemGreen)
        return button
    }
    
    class func standardButton(withTitle title: String) -> UIButton {
        let button = BaseButton.getButton(withTitle: title, withColor: .lightGray)
        return button
    }
    
    static func getButton(withTitle title: String, withColor color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.Value.cornerRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = CustomFont.getRegularFont()
        return button
    }
    
}


struct CustomFont {
    
    static func getRegularFont(withSize size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Arial", size: size)!
    }
    
    static func getLightFont(withSize size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Arial", size: size)!
    }
    
    static func getBoldFont(withSize size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Arial", size: size)!
    }
    
    static func getLightFontItalic(withSize size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Arial", size: size)!
    }
    
}


extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints( NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary) )
    }
    
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /**
     * Add border to View
     *
     */
    func addBorder(borderColor: UIColor = UIColor.red, widthBorder: CGFloat = 1.0) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = widthBorder
    }
    
    func removeViews() {
        for v in self.subviews {
            v.removeFromSuperview()
        }
    }

    
    func centerViewIn(superView: UIView) {
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
}



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


