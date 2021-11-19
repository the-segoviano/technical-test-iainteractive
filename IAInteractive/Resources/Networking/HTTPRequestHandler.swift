//
//  HTTPRequestHandler.swift
//  Performance Galeria
//
//  Created by Luis Segoviano on 12/10/20.
//

import UIKit

/*
 * Class: HTTPRequestHandler
 *
 *
 * timeoutIntervalForRequest - The timeout interval to use when waiting for additional data. The timer associated with this value is reset whenever new data arrives. When the request timer reaches the specified interval without receiving any new data, it triggers a timeout.
 *
 * timeoutIntervalForResource - The maximum amount of time that a resource request should be allowed to take. This value controls how long to wait for an entire resource to transfer before giving up. The resource timer starts when the request is initiated and counts until either the request completes or this timeout interval is reached, whichever comes first.
 *
 */
final class HTTPRequestHandler {
    
    private init() {}
    
    static let sharedInstance = HTTPRequestHandler()
    
    let timeOut: TimeInterval = TimeInterval(60)
    
    lazy var urlSessionConfiguration: URLSessionConfiguration = {
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.httpCookieStorage = nil
        urlSessionConfiguration.timeoutIntervalForRequest = timeOut
        urlSessionConfiguration.timeoutIntervalForResource = timeOut
        return urlSessionConfiguration
    }()
    
    /*
     * Ejecuta la peticion solicitada.
     *
     * Retorna un error o un resultado de tipo Data
     *
     */
    func fetchDataRequest(url: URL, method: HTTPMethod,
                          paramsBody: [String: Any] = [:],
                          reference viewController: UIViewController,
                          completion: @escaping (Result<Data, Error>) -> ())
    {
        print(" url ", url)
        startRequestAnimations()
        var request: URLRequest  = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = timeOut
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json; charset=utf-8"
        headers["Accept-Encoding"] = "application/json"
        headers["api_key"] = "stage_HNYh3RaK_Test"
        
        if !paramsBody.isEmpty {
            headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: paramsBody, options: []) else {
                completion(.failure("Error al procesar información." as! Error))
                return
            }
            print("\n\n httpBody ", httpBody.description, "\n\n")
            request.httpBody = httpBody
        }
        request.allHTTPHeaderFields = headers
        
        print("\n request.allHTTPHeaderFields ", request.allHTTPHeaderFields, "\n")
        
        let session: URLSession = URLSession(configuration: urlSessionConfiguration)
        let task = session.dataTask(with: request) { data, response, error in
            self.stopRequestanimations()
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200
            {
                print(" httpStatus.statusCode ", httpStatus.statusCode)
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                            print("\n\n json - NO 200 ", json, "\n\n")
                        }
                    } catch {
                        print(" Error parsing JSON - NO 200 ", error.localizedDescription, "\n")
                    }
                }
                completion(.failure(ErrorHandler.getErrorByCode(code: httpStatus.statusCode)))
                return
            }
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        print("\n\n json - 200 ", json, "\n\n")
                    }
                } catch {
                    print(error)
                }
                completion(.success(data))
            }
            
        }
        task.resume()
    }
    
    func startRequestAnimations() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func stopRequestanimations() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    
}


enum UnknowError: Error {
    case unknowError(String)
}
