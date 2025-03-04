//
//  AllChangesView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 03/03/2025.
//

import SwiftUI

struct AllChangesView: View {

	let categories = [
		CategoryItem(title: "Clothing", imageName: "Placeholder1", items: ["Dresses", "Pants", "Skirt", "Grape"]),
		CategoryItem(title: "Shoes", imageName: "Placeholder2", items: ["MacBook", "iPhone", "iPad", "Watch"]),
		CategoryItem(title: "Bags", imageName: "Placeholder3", items: ["Tesla", "Ford", "BMW", "Audi"])
	]

	// Store expanded state per row
	@State private var expandedRows: [UUID: Bool]

	init() {
		_expandedRows = State(initialValue: Dictionary(uniqueKeysWithValues: categories.map { ($0.id, false) }))
	}

	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]

    var body: some View {
		VStack {
			HStack {
				Text("All Categories")
					.applyFont(.raleway, .bold, 28)
				Spacer()
				Image(systemName: "xmark")
					.fontWeight(.bold)
			}
			.padding(.horizontal, 20)
			List {
				ForEach(categories) { category in
					VStack {
						ZStack {
							RoundedRectangle(cornerRadius: 5)
								.fill(Color.white)
								.frame(height: 50)
							HStack {
								Image(category.imageName)
									.resizable()
									.scaledToFit()
									.frame(width: 44, height: 44)
									.clipped()

								Text(category.title)
									.applyFont(.raleway, .bold, 17)

								Spacer()

								Button(action: {
									withAnimation {
										expandedRows[category.id] = !(expandedRows[category.id] ?? false)
									}
								}) {
									Image(systemName: expandedRows[category.id] ?? false ? "chevron.up" : "chevron.down")
										.foregroundStyle(expandedRows[category.id] ?? false ?  Color.mainBlue : Color.mainBlack)
										.fontWeight(.bold)
								}
							}
							.padding(.trailing)
							.padding(.leading, 5)
						}
						.frame(height: 50)
						.shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
						.padding(5)
						if expandedRows[category.id, default: false] {
							LazyVGrid(columns: columns, spacing: 10) {
								ForEach(category.items, id: \.self) { item in
									Text(item)
										.frame(height: 40)
										.frame(maxWidth: .infinity)
										.cornerRadius(10)
										.foregroundColor(.black)
										.padding(.horizontal, 10)
										.overlay(
											RoundedRectangle(cornerRadius: 10)
												.stroke(Color.categoryPink, lineWidth: 2) // Blue outline stroke
										)
										.padding(.vertical, 2)
								}
							}
							.transition(.move(edge: .top).combined(with: .opacity))
						}
					}
					.cornerRadius(12) // Rounded corners
					.listRowBackground(Color.clear) // Make List background clear
					.listRowSeparator(.hidden) // Hide List separators
				}
			}
			.listStyle(.plain) // Remove default list styling
		}
    }
}

#Preview {
    AllChangesView()
}
