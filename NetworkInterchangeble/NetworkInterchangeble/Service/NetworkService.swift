//
//  NetworkService.swift
//  NetworkInterchangeble
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import Foundation

protocol NetworkService {
    
    func donwload(_ resource : String) async throws -> [User] 
    var type : String{get}
    
}
