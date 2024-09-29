import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = AuthViewModel()
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var goToHome = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("register_icon")
                
                Text("Let's create an account")
                    .font(.custom("Roboto-Bold", size: 20))
                    .foregroundColor(.primaryTextColor)
                
                Spacer()
                
                HStack {
                    Text("Create a nickname (required)")
                        .font(.custom("Roboto-Bold", size: 14))
                        .foregroundColor(.strokeColor)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading)
                
                TextField("", text: $username)
                    .foregroundColor(.white)
                    .placeholder(when: username.isEmpty, placeholder: {
                        Text("@nickname")
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
                
                
                HStack {
                    Text("Link a phone number or email (required)")
                        .font(.custom("Roboto-Bold", size: 14))
                        .foregroundColor(.strokeColor)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading)
                
                TextField("", text: $email)
                    .foregroundColor(.white)
                    .placeholder(when: email.isEmpty, placeholder: {
                        Text("Email or Phone number")
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
                
                HStack {
                    Text("Create a password (required)")
                        .font(.custom("Roboto-Bold", size: 14))
                        .foregroundColor(.strokeColor)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading)
                
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
                
                HStack {
                    Text("Confirm password (required)")
                        .font(.custom("Roboto-Bold", size: 14))
                        .foregroundColor(.strokeColor)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .top])
                
                SecureField("", text: $confirmPassword)
                    .foregroundColor(.white)
                    .placeholder(when: confirmPassword.isEmpty, placeholder: {
                        Text("Confirm password")
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
                
                NavigationLink(destination: AuthView()
                    .navigationBarBackButtonHidden(true)) {
                        Text("I already have an account.")
                            .foregroundColor(.white)
                            .font(.custom("Roboto-Regular", size: 12))
                            .padding(.bottom)
                    }
                
                Button {
                    viewModel.register(username: username, email: email, password: password) { response in
                        if response.errors == nil {
                            goToHome = true
                        }
                    }
                } label: {
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
    }
}

#Preview {
    RegisterView()
}
