//
//  CartProductView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 06/03/2025.
//

import SwiftUI

struct CartProductView: View {
	@Binding var product: ProductModel
	let deleteAction: () -> ()

    var body: some View {
		HStack {
			ZStack(alignment: .bottomLeading) {
				Image(product.image)
					.resizable()
					.scaledToFill()
					.cornerRadius(10)
					.frame(width: 120, height: 108)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.overlay(RoundedRectangle(cornerRadius: 10)
						.stroke(Color.white, lineWidth: 4))
					.shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
				ZStack {
					Circle()
						.fill(Color.white)
						.frame(width: 30, height: 30)

					Image("Delete")
						.foregroundStyle(.favoriteRed)
						.onTapGesture {
							deleteAction()
						}
				}
				.padding([.leading, .bottom], 10)
				.onTapGesture {

				}
			}
			VStack(alignment: .leading) {
				Text(product.description)
					.applyFont(.nunitoSans, .regular, 12)
				Spacer()
				Text("\(product.color), Size \(product.size)")
					.applyFont(.raleway, .regular, 14)
				Spacer()
				HStack {
					Text("\(product.price, format: .currency(code: "USD"))")
						.applyFont(.raleway, .bold, 18)
					Spacer()
					NumberOfItemsChangerView(numberOfItems: $product.numberOfItems)
				}
			}
		}
		.frame(height: 100)
		.padding(.vertical, 10)
		.padding(.leading, 10)
    }
}

struct NumberOfItemsChangerView: View {
	@Binding var numberOfItems: Int

	var body: some View {
		HStack {
			Image(systemName: "minus.circle")
				.applyFont(.nunitoSans, .bold, 30)
				.foregroundStyle(numberOfItems == 0 ? .registerGray : .mainBlue)
				.onTapGesture {
					if numberOfItems > 0 {
						numberOfItems -= 1
					}
				}
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.chartBlue)
					.frame(width: 37, height: 30)
				Text("\(numberOfItems)")
			}

			Image(systemName: "plus.circle")
				.applyFont(.nunitoSans, .bold, 30)
				.foregroundStyle(.mainBlue)
				.onTapGesture {
					numberOfItems += 1
				}
		}
	}
}

#Preview {
	CartProductView(product: .constant(ProductModel(
		image: "pinkSkirt",
		description: "Cotton T-Shirt",
		numberOfItems: 1,
		color: "White",
		size: "M",
		price: 19.99
	)), deleteAction: {})
}
