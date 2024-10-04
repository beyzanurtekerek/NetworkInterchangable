//
//  WebService.swift
//  NetworkInterchangable
//
//  Created by Beyza Nur Tekerek on 5.10.2024.
//

import Foundation

enum NetworkerError: Error {
    case invalidURL
    case invalidResponse
}

class Webservice : Networkservice{
    
    var type: String = "Webservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworkerError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkerError.invalidResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
}
