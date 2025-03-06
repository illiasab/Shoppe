//
//  AllCategoriesModel.swift
//  Shoppe
//
//  Created by Julia Martcenko on 03/03/2025.
//

import Foundation

struct CategoryItem: Identifiable {
	let id = UUID()
	let title: String
	let imageName: String
	let items: [String] // Items for LazyVGrid
}
