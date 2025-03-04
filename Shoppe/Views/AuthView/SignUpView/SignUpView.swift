//
//  SIgnUpView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct SignUpView: View {
    var viewModel: SignUpViewModelDelegate?
    var onSignUpSuccess: (() -> Void)?
    var onCancelTapped: (() -> Void)?
    var title = ""
    var body: some View {
        VStack{
            CustomButtonView(title:"Done", action:{
                onSignUpSuccess?()
            })
            
            Button(action: {
                onCancelTapped?()
            }) {
                Text("Cancel")
                    .applyFont(.raleway,.bold,15)
                    .foregroundColor(.mainBlack)
            }
            .padding(.top,24)
        }
    }
}


#Preview {
    SignUpView()
}
