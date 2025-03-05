//
//  LogInView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct LoginView: View {
    var viewModel: LoginViewModelDelegate?
    var onLoginSuccess: (() -> Void)?
    var onCancelTapped: (() -> Void)?
    @State var email: String = ""
    var title = ""
    var body: some View {
        ZStack{
            Image(ImageName.grayLogBubble)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 373, height: 442)
                
                .offset(y: -55 * 2)
                .offset(x:-50)
            ZStack{
                Image(ImageName.blueBuble)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 402, height: 442)
                    .offset(y: -90 * 2)
                    .offset(x: -55 * 2)
                
                Image(ImageName.miniBlueBubble)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 137, height: 151)
                    .offset(y:80)
                    .offset(x:90 * 2)
            }
        }
        VStack{
                VStack(alignment:.leading){
                    Text(Constants.LogIn)
                        .applyFont(.raleway,.bold,52)
                        .foregroundColor(.mainBlack)
                        .padding(.bottom,5)
                    Text(Constants.LogInSubTitle)
                        .applyFont(.nunitoSans,.light,19)
                        .foregroundColor(.mainBlack)
                    
                    
                    
                }
                .padding(.trailing,15 * 10)
                .padding(.bottom,17.10)
                CustomTextFieldView(credentials: email, color: .textField, textFieldTitle: "Email")
                
                
                    .padding(.bottom,37)
                VStack(spacing: 14){
                    CustomButtonView(title: "Next", action: {
                        onLoginSuccess?()
                    })
                    
                    
                    
                    Button(action: {
                        onCancelTapped?()
                    }) {
                        Text("Cancel")
                            .applyFont(.nunitoSans,.light,15)
                            .foregroundColor(.mainBlack)
                    }
                }
                .padding(.bottom,100)
            
                        
        }
    }
}

#Preview {
    LoginView()
}
