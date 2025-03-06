//
//  CartView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 06/03/2025.
//

import SwiftUI

struct CartView: View {

	let cartItems: [CartModel] = [
		CartModel(
			image: "shoe_image",
			description: "Nike Running Shoes",
			numberOfItems: 2,
			color: "Black",
			size: "42",
			price: 99.99
		),
		CartModel(
			image: "tshirt_image",
			description: "Cotton T-Shirt",
			numberOfItems: 1,
			color: "White",
			size: "M",
			price: 19.99
		)
	]

	@State var address: String = "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city"

    var body: some View {
		VStack {
			HStack {
				Text("Chart")
					.applyFont(.raleway, .bold, 36)
				NumberOfItemsView(number: cartItems.count)
				Spacer()

			}
			.padding()
			AddressView(address: $address)
			ScrollView {
				
			}
		}

    }
}

struct NumberOfItemsView: View {
	var number: Int

	var body: some View {
		ZStack {
			Circle()
				.fill(Color.chartBlue)
				.frame(width: 30, height: 30)

			Text("\(number)")
				.applyFont(.raleway, .bold, 18)
		}
	}
}

struct AddressView: View {
	@Binding var address: String
	@State var isAdditingMode: Bool = false

	var body: some View {
		VStack(alignment: .leading) {
			Text("Shipping Address")
				.applyFont(.raleway, .bold, 18)

			HStack(alignment: .bottom) {
				if isAdditingMode {
					TextField("Address", text: $address)
						.textFieldStyle(.roundedBorder)
						.onSubmit {
							isAdditingMode = false // Exit editing mode when Enter is pressed
						}
				} else {
					Text(address)
						.applyFont(.raleway, .regular, 14)
						.lineLimit(nil) // Allows text to expand dynamically

				}

				ZStack {
					Circle()
						.fill(Color.mainBlue)
						.frame(width: 30, height: 30)

					Image(systemName: "pencil")
						.foregroundStyle(.white)
				}
				.padding(.leading, 10)
				.onTapGesture {
					isAdditingMode.toggle()
				}
			}
		}
		.padding(16) // Ensures space inside the shape
		.background(
			RoundedRectangle(cornerRadius: 12)
				.fill(Color.customGray)
		)
		.padding(20) // Outer padding for spacing
	}
}

#Preview {
    CartView()
}
