//
//  RequestManager.swift
//  Performance Galeria
//
//  Created by Luis Segoviano on 12/10/20.
//

import UIKit

class RequestManager {
    
    typealias carteleraCompletion = (Result<CarteleraResponse, Error>) -> Void
    
    class func fetchCartelera(reference: UIViewController,
                              completion: @escaping carteleraCompletion)
    {
        HTTPRequestHandler.sharedInstance.fetchDataRequest(url: Endpoint.movies(country_code: "MX", cinemas: 61).url,
                                                           method: HTTPMethod.GET,
                                                           reference: reference)
        { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode(CarteleraResponse.self, from: data)
                    completion(.success(response))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    typealias loginCompletion = (Result<UserLoggedResponse, Error>) -> Void
    
    class func userLogin(reference: UIViewController,
                         withParams params: [String: Any],
                         completion: @escaping loginCompletion)
    {
        HTTPRequestHandler.sharedInstance.fetchDataRequest(url: Endpoint.login.url,
                                                           method: HTTPMethod.POST,
                                                           paramsBody: params,
                                                           reference: reference)
        { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode(UserLoggedResponse.self, from: data)
                    completion(.success(response))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    /*
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // MARK: SERVICIO PARA LOGIN DEL USUARIO.
    //
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    class func loginUser(reference: UIViewController, withParams params: [String: Any],
                                //completion: @escaping (Result<LoginResponse, Error>) -> ()
                         completion: @escaping (_ response: LoginResponse?, _ error: ErrorCodeResponse) -> ()
    ){
        HTTPRequestsHandler.sharedInstance.fetchDataRequest(
            url: Endpoint.login.url,
            method: HTTPMethod.POST,
            paramsBody: params,
            reference: reference
        ) { result in
            switch result {
            case .success(let productAddedResponse):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode(LoginResponse.self, from: productAddedResponse)
                    
                    completion(response, ErrorCodeResponse(errors: [ErrorCodeDescription(description: "",
                                                                                         code: 0)]))
                    
                } catch let error {
                    
                    print(" RequestManager - Parse ", error, "\n")
                    
                    completion(nil, ErrorCodeResponse(errors: [ErrorCodeDescription(description: error.localizedDescription,
                                                                                    code: 0)]))
                }
            case .failure(let error):
                
                print(" RequestManager - type ", type(of: error), "\n")
                print(" RequestManager - failure ", error, "\n")
                print(" RequestManager - failure ", error.localizedDescription, "\n")
                
                completion(nil, ErrorCodeResponse(errors: [ErrorCodeDescription(description: error.localizedDescription,
                                                                                code: 0)]))
            }
        }
    } // [END] addProductToCart
    */
}
