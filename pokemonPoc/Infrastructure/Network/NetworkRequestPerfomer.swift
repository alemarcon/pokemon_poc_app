//
//  NetworkRequestPerfomer.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

class NetworkRequestPerformerSwift {
    
    static func performRequest<T:Decodable>(router: APIConfiguration, completion: @escaping (T?, CustomError?) -> Void) {
        
//        let url = URL(string: router.path)!
//
//        let requestHeader = router.requestHeader
//        var requestBodyComponent = URLComponents()
//        requestBodyComponent.queryItems = router.queryItems
//
//        var request = URLRequest(url: url)
//        request.httpMethod = router.httpMethod
//        request.allHTTPHeaderFields = requestHeader
//        request.httpBody = requestBodyComponent.query?.data(using: .utf8)
        
        let request = router.toUrlRequest()
        
        //create dataTask using the session object to send data to the server
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                LOGE("Error \(error!.localizedDescription)")
                completion(nil, CustomError.generic(0, error!.localizedDescription))
                return
            }
            
            guard let data = data else {
                LOGE("URLSession, received nil data from server calling \(request.url?.absoluteString ?? "unknow url")")
                completion(nil, CustomError.dataNil)
                return
            }
            
            
            do {
                let successData = try JSONDecoder().decode(T.self, from: data)
                completion(successData, nil)
            } catch(let error) {
                LOGE(error.localizedDescription)
                completion(nil, CustomError.generic(2000, error.localizedDescription))
            }
            
            
            
//            do {
//                //create json object from data
//                let authObject = try JSONDecoder().decode(AuthenticationResponseDTO.self, from: data)
//                if let dtoerror = authObject.error {
//                    Application.print(level: .warning, "Found error message in DTO: \(dtoerror)")
//                    var ve = VetryaAuthError()
//                    ve.errorMessage = dtoerror
//                    ve.statusCode = authObject.statusCode ?? 0
//                    ve.type = .invalidParameterError
//                    completion(authObject, ve)
//                } else if let statusCode = authObject.statusCode, statusCode == 404 {
//                    Application.print(level: .warning, "Server respond with 404 status")
//                    var ve = VetryaAuthError()
//                    ve.errorMessage = authObject.errorMessage ?? ""
//                    ve.statusCode = authObject.statusCode ?? 0
//                    ve.type = .resourceNotFoundError
//                    completion(authObject, ve)
//                } else {
//                    Application.print(level: .verbose, "Server response with success")
//                    completion(authObject, nil)
//                }
//            } catch let error {
//                Application.print(level: .warning, "Error while decoding DTO: \(error.localizedDescription)")
//                var ve = VetryaAuthError()
//                ve.e = error
//                ve.type = .invalidJSONType
//                completion(nil, ve)
//                return
//            }
        })
        
        task.resume()
    }

}
