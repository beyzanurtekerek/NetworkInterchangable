//
//  Networkservice.swift
//  NetworkInterchangable
//
//  Created by Beyza Nur Tekerek on 5.10.2024.
//

import Foundation

// bu protokolu uygulayan herkes bundan sonra bu fonksiyonu uygulamak zorunda
protocol Networkservice {
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}
