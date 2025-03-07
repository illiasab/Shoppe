//
//  EditPencilView.swift
//  Shoppe
//
//  Created by Julia Martcenko on 07/03/2025.
//

import SwiftUI

struct EditPencilView: View {
	var action: () -> Void

    var body: some View {
		ZStack {
			Circle()
				.fill(Color.mainBlue)
				.frame(width: 30, height: 30)

			Image(systemName: "pencil")
				.foregroundStyle(.white)
		}
		.padding(.leading, 10)
		.onTapGesture {
			action()
		}
    }
}

#Preview {
	EditPencilView(action: {})
}
