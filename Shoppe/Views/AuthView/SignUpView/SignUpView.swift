//
//  SIgnUpView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    var viewModel: SignUpViewModelDelegate?
    var onSignUpSuccess: (() -> Void)?
    var onCancelTapped: (() -> Void)?
    var title = ""
    var body: some View {
        VStack{
            ZStack{
                Image(ImageName.grayBubble)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(10 * 5.5))
                    .frame(width: 312,height: 368)
                    .offset(y:-50 * 4.5)
                    .offset(x:-60)
                
                Text(Constants.signUp)
                    .applyFont(.raleway, .bold,50)
                    .foregroundColor(.mainBlack)
                    .padding(.bottom,80 * 2)
                    .padding(.trailing,110)
                
                
                Image(ImageName.signUpBlueBubble)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:244,height:267)
                    .offset(y:-30 * 3)
                    .offset(x:80 * 2)
            }
                
        }
        VStack{
            
            VStack{
                CustomTextFieldView(credentials: email, color: .textField, textFieldTitle: "Email")
                    
                CustomTextFieldView(credentials: password, color: .textField, textFieldTitle: "Password")
            }
            .padding(.bottom,62)
            CustomButtonView(title:"Done", action:{
                onSignUpSuccess?()
            })
            Button(action: {
                onCancelTapped?()
            }) {
                Text("Cancel")
                    .applyFont(.nunitoSans,.light,15)
                    .foregroundColor(.mainBlack)
            }
            .padding(.top,24)
        }
        
    }
}


#Preview {
    SignUpView()
}
