//
//  UserLoggedResponse.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import Foundation

// MARK: - UserLoggedResponse
struct UserLoggedResponse: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken, asClientID, username, countryCode: String
    let issued, expires: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case asClientID = "as:client_id"
        case username
        case countryCode = "country_code"
        case issued = ".issued"
        case expires = ".expires"
    }
}
