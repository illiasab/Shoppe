//
//  AllCarts.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//

import Foundation

struct Products: Codable, Hashable  {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
