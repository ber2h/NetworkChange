//
//  LocalService.swift
//  NetworkInterchangeble
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import Foundation

class LocalService : NetworkService {
    
    var type: String = "LocalService"

    
    func donwload(_ resource : String) async throws -> [User] {
            
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resorce Not Found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
}
