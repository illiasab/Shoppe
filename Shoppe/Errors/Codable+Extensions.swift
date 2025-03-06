//
//  Codable+Extensions.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//
import Foundation

extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
