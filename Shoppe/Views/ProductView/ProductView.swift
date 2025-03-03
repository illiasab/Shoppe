//
//  ProductView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 02/03/2025.
//

import SwiftUI

struct ProductView: View {
	let price: Double
	let description: String

	let imageNames = ["Placeholder1", "Placeholder2", "Placeholder3"]
	let mainImageNames = ["PlaceholderProduct", "PlaceholderProduct", "PlaceholderProduct"]
	let variationPlaceholders = ["Pink", "M"]

	@State private var currentIndex = 0
	@State private var isFavourite = false

	var body: some View {
		GeometryReader { geometry in
			VStack(alignment: .leading) {
				MainImageView(mainImageNames: mainImageNames)
					.frame(width: geometry.size.width, height: geometry.size.height * 3 / 7)
				HStack {
					Text("\(price, format: .currency(code: "USD"))")
						.applyFont(.raleway, .bold, 26)
					Spacer()
					Image(systemName: isFavourite ? "heart.fill" : "heart")
						.foregroundColor(.red)
						.font(.title2)
						.fontWeight(.bold)
				}
				.padding(20)
				Text(description)
					.applyFont(.nunitoSans, .regular, 15)
					.padding(.horizontal, 20)
				HStack(alignment: .center) {
					Text("Variations")
						.applyFont(.raleway, .bold, 20)
						.padding(20)
					ForEach(variationPlaceholders, id: \.self) { placeholder in
						FilterProductViewButton(label: placeholder)
					}
				}
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 15) {
						ForEach(imageNames, id: \.self) { imageName in
							Image(imageName)
								.resizable()
								.scaledToFill()
								.frame(minWidth: 75, minHeight: 75)
								.clipShape(RoundedRectangle(cornerRadius: 10))
								.shadow(radius: 5)
						}
					}
					.padding(.horizontal, 20)
					.padding(.vertical, 10)
				}
				BottomTabBar(isFavourite: $isFavourite)
			}
		}
	}
}

struct FilterProductViewButton: View {
	let label: String

	var body: some View {
		Button(action: {
			// Action when button is tapped
			print("Button tapped!")
		}) {
			Text(label)
				.foregroundColor(.mainBlack)
				.applyFont(.raleway, .regular, 14)
				.padding(.vertical, 5)
				.frame(minWidth: 54)
				.background(.customGray) // Background color
				.cornerRadius(5) // Rounded corners
		}
	}
}

struct BottomTabBar: View {
	@Binding var isFavourite: Bool

	var body: some View {
		HStack {
			Button(action: {
				isFavourite.toggle()
			}) {
				Image(systemName: isFavourite ? "heart.fill" : "heart")
					.foregroundColor(.red)
					.font(.title2)
					.padding(10)
					.background(.customGray)
					.cornerRadius(10)
			}
			TapBarProductViewButton(action: {}, label: "Add to cart", color: .mainBlack)
			TapBarProductViewButton(action: {}, label: "Buy now", color: .mainBlue)
		}
		.padding(.horizontal, 20)
	}
}

struct TapBarProductViewButton: View {
	let action: () -> ()
	let label: String
	let color: Color

	var body: some View {
		Button(action: action) {
			Text(label)
				.foregroundColor(.white)
				.applyFont(.nunitoSans, .regular, 16)
				.padding(10)
				.frame(maxWidth: .infinity)
				.background(color)
				.cornerRadius(10)
		}
	}
}

struct MainImageView: View {
	let mainImageNames: [String]
	@State private var currentIndex = 0

	var body: some View {
		ZStack {
			// MARK: - TabView (Horizontal Scrolling)
			TabView(selection: $currentIndex) {
				ForEach(mainImageNames.indices, id: \.self) { index in
					Image(mainImageNames[index])
						.resizable()
						.scaledToFill()
						.tag(index) // Each tab has an index
				}
			}
			.tabViewStyle(.page(indexDisplayMode: .never)) // Hide default dots

			// MARK: - Custom Dots
			VStack {
				Spacer()
				HStack(spacing: 8) {
					ForEach(mainImageNames.indices, id: \.self) { index in
						RoundedRectangle(cornerRadius: 5)
							.fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.5))
							.frame(width: index == currentIndex ? 40 : 10, height: index == currentIndex ? 10 : 10) // Active dot is bigger
							.animation(.spring(), value: currentIndex)
					}
				}
				.padding(.bottom, 8)
			}
		}
	}
}


#Preview {
	ProductView(price: 17, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.")
}
