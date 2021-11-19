//
//  RequestErrors.swift
//  Performance Galeria
//
//  Created by Luis Segoviano on 12/10/20.
//

import Foundation

enum RequestErrors: Error {
    case unknownError
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case unsuppotedURLOrMediaType
    case methodNotAllowed
    case serverError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case versionNotSupported
    case timeOutError
    case connectionError
}
