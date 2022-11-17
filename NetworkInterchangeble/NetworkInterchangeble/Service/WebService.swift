//
//  WebService.swift
//  NetworkInterchangeble
//
//  Created by Bertuğ Horoz on 16.11.2022.
//

import Foundation


enum NetworkError : Error {
    case InvalidUrl
    case InvalidServerResponse
}


class WebService : NetworkService {
    
    var type: String = "Webservice"
    
    func donwload(_ resource : String) async throws -> [User] {
            
        guard let url = URL(string: resource) else {
            throw NetworkError.InvalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.InvalidServerResponse
        }
        
        return try JSONDecoder().decode( [User].self, from: data)
        
    }
    
}
