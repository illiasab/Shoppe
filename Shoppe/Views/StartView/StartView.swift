//
//  StartView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct StartView: View {
    var onLoginTapped: (() -> Void)?
    var onSignUpTapped: (() -> Void)?
    var controllers: [any View] = []
    var startIndex = 0
    var body: some View {
        VStack{
            ZStack {
                VStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 134, height: 134)
                        .shadow(color: .black.opacity(0.16), radius: 4, x: 0, y: 3)
                }
                Image("ShoppeBag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 81.4, height: 92)
                
            }
            Text("Shoppe")
                .applyFont(.raleway,.bold,52)
                .padding(.top,24)
            
            VStack{
                CustomButtonView(title:Constants.start , action: {})
               
                    Button(action:{
                        
                    })
                    {
                        HStack{
                            Text(Constants.haveAccount)
                                .applyFont(.nunitoSans,.light,15)
                                .foregroundColor(.mainBlack)
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30, height:30)
                                .padding(.leading,16)
                            .foregroundColor(.mainBlue)                        }
                        .padding(.top,24)

                        
                    }
                
                
            }
            .padding(.top,183)
        }
        .padding(.top,100)
    }
}


#Preview {
    StartView()
}
