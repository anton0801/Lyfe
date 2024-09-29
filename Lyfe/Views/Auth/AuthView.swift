import SwiftUI

struct AuthView: View {
    
    @State var username = ""
    @State var password = ""
    @State var goToHome = false
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("auth_icon")
                
                Text("Login to account")
                    .font(.custom("Roboto-Bold", size: 20))
                    .foregroundColor(.primaryTextColor)
                
                Spacer()
                
                TextField("", text: $username)
                    .foregroundColor(.white)
                    .placeholder(when: username.isEmpty, placeholder: {
                        Text("Email, Phone number, @nickname")
                            .foregroundColor(.strokeColor)
                            .font(.custom("Roboto-Regular", size: 18))
                    })
                    .font(.custom("Roboto-Regular", size: 18))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.strokeColor, lineWidth: 1)
                    )
                    .padding()
                
                if viewModel.usernameField.error != nil {
                    VStack(alignment: .leading) {
                        Text(viewModel.usernameField.error!)
                            .padding(.horizontal)
                            .font(.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.red)
                    }
                }
                
                SecureField("", text: $password)
                    .foregroundColor(.white)
                    .placeholder(when: password.isEmpty, placeholder: {
                        Text("Password")
                            .foregroundColor(.strokeColor)
                            .font(.custom("Roboto-Regular", size: 18))
                    })
                    .font(.custom("Roboto-Regular", size: 18))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.strokeColor, lineWidth: 1)
                    )
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12))
                
                if viewModel.passwordField.error != nil {
                    VStack(alignment: .leading) {
                        Text(viewModel.usernameField.error!)
                            .padding(.horizontal)
                            .font(.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                Button {
                    viewModel.auth(username: username, password: password) { response in
                        if response.errors == nil {
                            goToHome = true
                        }
                    }
                } label: {
                    Text("Login")
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
                
                NavigationLink(destination: HomeView()
                    .navigationBarBackButtonHidden(true), isActive: $goToHome) {
                        
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
    AuthView()
}
