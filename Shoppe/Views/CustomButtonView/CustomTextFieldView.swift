//
//  CustomTextFieldView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/4/25.
//
import SwiftUI


struct CustomTextFieldView: View{
    @State var credentials: String
    var color: Color
    var textFieldTitle: String
    var isSecureTextField: Bool = false
    @State var isSecureTextEntry: Bool = false
    var body: some View{
        VStack{
            HStack{
                TextField(textFieldTitle,text: $credentials)
                    .foregroundColor(.mainBlack)
                if isSecureTextField {
                    Button(action:{
                        isSecureTextEntry.toggle()
                    })
                    {
                        Image(systemName: isSecureTextEntry ?"eye" : "eye.slash")
                            .frame(width: 16, height: 16)
                            .foregroundColor(.mainBlack)
                            .padding(.trailing,20)
                    }
                }
            }
            .padding(.leading,20)
            .frame(width:335,height: 53)
            .background(color)
            .cornerRadius(60)
        }
    }
}
#Preview{
    CustomTextFieldView(credentials: "", color: .textField, textFieldTitle: "Email")
}
