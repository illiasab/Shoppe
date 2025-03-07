//
//  ProductModel.swift
//  Shoppe
//
//  Created by Julia Martcenko on 06/03/2025.
//

import Foundation

struct ProductModel: Hashable {
	let image: String
	let description: String
	var numberOfItems: Int
	let color: String
	let size: String
	let price: Double
}
