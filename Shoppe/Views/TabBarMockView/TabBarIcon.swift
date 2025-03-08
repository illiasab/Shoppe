//
//  TabBarIcon.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/7/25.
//

import SwiftUI

struct TabBarIcon: View {
    @ObservedObject var viewRouter: ViewRouter
    let width, height: CGFloat
    let tab: Tab
    let iconName, tabName: String

    var body: some View {
        Button(action: {
            viewRouter.currentTab = tab
        }) {
            VStack {
                Image(iconName)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.top, 10)
                    .foregroundColor(viewRouter.currentTab == tab ? Color.mainBlue : Color.mainBlack)
                
                Text(tabName)
                    .font(.footnote)
                    .foregroundColor(viewRouter.currentTab == tab ? Color.mainBlue : Color.mainBlack)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
