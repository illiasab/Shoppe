import SwiftUI

struct OnboardingView: View {
    let pages = [
        (image: "shoppingImage1", title: "Welcome!", description: "Discover a fast and easy way to shop online."),
        (image: "shoppingImage2", title: "Smart Search & Favorites", description: "Find products instantly and save favorites for later."),
        (image: "shoppingImage3", title: "Easy Checkout", description: "Add to cart, choose payment, and order in seconds."),
        (image: "shoppingImage4", title: "Manage Your Store", description: "Become a manager, add products, and control your catalog!")
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            Image("bubble2")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding(.leading, -100)
                .padding(.top, 250)
            
            Image("bubble1")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding(.leading, -100)
                .padding(.top, -100)
            Spacer()
            ZStack {
                VStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<pages.count, id: \ .self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.85)
                                
                                VStack {
                                    Image(pages[index].image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.50)
                                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous).path(in: CGRect(x: 0, y: 0, width: geometry.size.width * 0.8, height: geometry.size.height * 1)))
                                        //.cornerRadius(20)
                                        .padding(.top, -100)
                                    Spacer()
                                    Spacer()
                                    Text(pages[index].title)
                                        .font(.custom("Raleway-Bold", size: 28))
                                        .bold()
                                        .padding(.top, 10)
                                        .padding(.horizontal, 20)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                    Text(pages[index].description)
                                        .font(.custom("NunitoSans-VariableFont_YTLC,opsz,wdth,wght", size: 17))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 40)
                                    Spacer()
                                    if index == pages.count - 1 {
                                        Button(action: {print(123)}) {
                                            Text("Начать")
                                                .font(.custom("NunitoSans-VariableFont_YTLC,opsz,wdth,wght", size: 22))
                                                .foregroundColor(.white)
                                                .frame(width: 200, height: 50)
                                                .background(Color.mainBlue)
                                                .cornerRadius(15)
                                        }
                                        .padding(.bottom, -100)
                                    }
                                }
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.6)
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    HStack(spacing: 8) {
                        ForEach(0..<pages.count, id: \ .self) { index in
                             
                            Circle()
                                .fill(index == currentPage ? Color.mainBlue : Color.mainBlue.opacity(0.2))
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.top, -20)
                    
                    Spacer()
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
