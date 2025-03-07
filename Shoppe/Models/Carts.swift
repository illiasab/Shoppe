//
//  Carts.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//

import Foundation

struct Carts: Codable {
    let id: Int
    let userId: Int
    let products: [Products]
}
