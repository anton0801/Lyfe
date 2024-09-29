import SwiftUI

struct AuthHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("LIFE")
                    .font(.custom("Roboto-Regular", size: 60))
                    .foregroundColor(.primaryTextColor)
                
                Text("The everything app.")
                    .multilineTextAlignment(.center)
                    .font(.custom("Roboto-Bold", size: 18))
                    .foregroundColor(.primaryTextColor)
                    .frame(width: 350)
                    .padding(.top, 4)
                HStack {
                    Text("A global social networking app.")
                        .font(.custom("Roboto-Regular", size: 15))
                        .foregroundColor(.primaryTextColor)
                    Text("Free")
                        .font(.custom("Roboto-Bold", size: 15))
                        .foregroundColor(.primaryTextColor)
                    Text("and")
                        .font(.custom("Roboto-Regular", size: 15))
                        .foregroundColor(.primaryTextColor)
                }
                Text("secure.")
                    .font(.custom("Roboto-Bold", size: 15))
                    .foregroundColor(.primaryTextColor)
                    .frame(width: 350)
                
                Spacer()
                
                NavigationLink(destination: AuthView()
                    .navigationBarBackButtonHidden(true)) {
                    Text("Sign in")
                        .font(.custom("Roboto-Bold", size: 18))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondaryTextColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.white)
                        )
                        .padding([.leading, .trailing])
                }
                
                NavigationLink(destination: RegisterView()
                    .navigationBarBackButtonHidden(true)) {
                    Text("Register")
                        .font(.custom("Roboto-Bold", size: 18))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondaryTextColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.white)
                        )
                        .padding([.leading, .trailing, .top])
                }
            }
            .background(
                Rectangle()
                    .fill(Color.mainBackground)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AuthHomeView()
}
