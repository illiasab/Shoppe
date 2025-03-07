//
//  CartView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 06/03/2025.
//

import SwiftUI

struct CartView: View {

	@State var cartItems: [ProductModel] = [
		ProductModel(
			image: "pinkSkirt",
			description: "Nike Running Shoes there arsldkfjlasjjf; lskjfljsflksjdlkjf slkdfjljslkdfj sldkfjalskdjf lssdkfjslfsldf sldkfjlsdfj",
			numberOfItems: 2,
			color: "Black",
			size: "42",
			price: 99.99
		),
		ProductModel(
			image: "pinkSkirt",
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
				NumberOfItemsView(number: calculateTotalNumberOfItems())
				Spacer()

			}
			.padding()
			AddressView(address: $address)
			ScrollView {
				ForEach($cartItems, id: \.self) { $item in
					CartProductView(product: $item, deleteAction: {print("Delete tapped!")})
				}
			}
			.scrollBounceBehavior(.basedOnSize)
			.scrollIndicators(.hidden)
			.padding(.horizontal)
			CheckoutButtonView(total: calculateTotalPrice(), action: {})
			BottomNavigationBar()
		}
	}

	func calculateTotalPrice() -> Double {
		cartItems.reduce(0) { result, item in
			result + Double(item.numberOfItems) * item.price
		}
	}

	func calculateTotalNumberOfItems() -> Int {
		cartItems.reduce(0) { result, item in
			result + item.numberOfItems
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

struct CheckoutButtonView: View {
	let total: Double
	let action: () -> Void

	var body: some View {
		HStack {
			Text("Total \(total, format: .currency(code: "USD"))")
				.applyFont(.raleway, .bold, 18)
			Spacer()
			Button(action: action) {
				Text("Checkout")
					.foregroundColor(.white)
					.applyFont(.nunitoSans, .regular, 16)
					.padding(10)
					.frame(maxWidth: 128, maxHeight: 40)
					.background(.mainBlue)
					.cornerRadius(10)
			}
		}
		.padding(20)
		.background(
			Color.customGray
		)
	}
}

#Preview {
    CartView()
}
