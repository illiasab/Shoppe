//
//  AddressView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 07/03/2025.
//

import SwiftUI

struct AddressView: View {
	@Binding var address: String
	@State var isEditingMode: Bool = false

	var body: some View {
		VStack(alignment: .leading) {
			Text("Shipping Address")
				.applyFont(.raleway, .bold, 18)

			HStack(alignment: .bottom) {
				if isEditingMode {
					TextField("Address", text: $address)
						.textFieldStyle(.roundedBorder)
						.onSubmit {
							isEditingMode = false // Exit editing mode when Enter is pressed
						}
				} else {
					Text(address)
						.applyFont(.raleway, .regular, 14)
						.lineLimit(nil) // Allows text to expand dynamically

				}
				Spacer()
				EditPencilView(action: {
					isEditingMode.toggle()
				})
			}
		}
		.padding(16) // Ensures space inside the shape
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(
			RoundedRectangle(cornerRadius: 12)
				.fill(Color.customGray)
		)
		.padding(20) // Outer padding for spacing
	}
}

#Preview {
	AddressView(address: .constant("Some address"))
}
