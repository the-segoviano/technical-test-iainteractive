//
//  Constants.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit


struct Constants {
    
    struct Strings {
        static let titleApp = "IA Interactive"
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
        static let genericAvatar: String = "avatar"
        
    }
    
    struct IdForCell {
        static let genericCell: String = "GenericCell"
        static let AvatarCell: String   = "AvatarCell"
        static let customHeader = "CustomHeader"
        static let footerCollectionViewCell: String = "FooterCollectionViewCell"
        
    }
    
}
