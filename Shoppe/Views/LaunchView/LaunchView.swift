//
//  LaunchView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import SwiftUI

struct LaunchView: View {
    @State private var bagTopOffset: CGFloat = -380
    @State private var bagHorizontalOffset: CGFloat = 80
    @State private var showTitle: Bool = false
    @State private var titleLetters: [Bool] = Array(repeating: false, count: 6)
    
    var isShowOnboardingBefore: Bool = false
    var didSendEventHandler: ((LaunchView.Event) -> Void)?

    enum Event {
        case launchComplete
    }

    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 134, height: 134)
                    .shadow(color: .black.opacity(0.16), radius: 4, x: 0, y: 3)
            }
            .padding(.bottom,150)

            Image("ShoppeBag")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 81.4, height: 92)
                .offset(x: bagHorizontalOffset, y: bagTopOffset)
                .onAppear {
                    startLaunchAnimation()
                }
            
            if showTitle {
                HStack(spacing: 2) {
                    ForEach(Array("Shoppe".enumerated()), id: \.offset) { index, letter in
                        Text(String(letter))
                            .applyFont(.raleway, .bold, 52)
                            .opacity(titleLetters[index] ? 1 : 0)
                            .animation(.easeIn(duration: 0.3).delay(Double(index) * 0.2), value: titleLetters[index])
                    }
                }
                .offset(y: 50)
            }
        }
    }

    private func startLaunchAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeOut(duration: 1)) {
                bagTopOffset = -75
                bagHorizontalOffset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showTitle = true
                animateLetters()
                triggerNextScreen()
            }
        }
    }

    private func animateLetters() {
        for i in titleLetters.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                titleLetters[i] = true
            }
        }
    }
    
    private func triggerNextScreen() {
        let delay: TimeInterval = isShowOnboardingBefore ? 1.0 : 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            didSendEventHandler?(.launchComplete)  
        }
    }
}

#Preview {
    LaunchView()
}
