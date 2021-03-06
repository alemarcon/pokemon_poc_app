//
//  NetworkRequestPerfomer.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

class NetworkRequestPerformer {
    
    /// Perform network request
    /// - Parameters:
    ///   - router: Router containing API information
    ///   - success: Event fired in success case
    ///   - failure: Event fired in error case
    static func performRequest<T:Decodable>(router: APIConfiguration, success: @escaping (T)->Void, failure: @escaping (CustomError)->Void) {
        let request = router.toUrlRequest()
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                LOGE("Error \(error!.localizedDescription)")
                
                if( error!._code == CustomErrorCode.noConnection.rawValue ) {
                    failure(CustomError.noConnection)
                } else {
                    failure(CustomError.generic(0, error!.localizedDescription))
                }
                return
            }
            
            guard let data = data else {
                LOGE("URLSession, received nil data from server calling \(request.url?.absoluteString ?? "unknow url")")
                failure(CustomError.dataNil)
                return
            }
            
            
            do {
                let successData = try JSONDecoder().decode(T.self, from: data)
                success(successData)
            } catch(let error) {
                LOGE(error.localizedDescription)
                failure(CustomError.generic(2000, error.localizedDescription))
            }
        })
        
        task.resume()
    }

}
