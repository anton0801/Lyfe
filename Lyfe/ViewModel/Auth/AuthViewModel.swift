import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var usernameField = FieldModel(value: "", error: nil)
    @Published var emailField = FieldModel(value: "", error: nil)
    @Published var passwordField = FieldModel(value: "", error: nil)
    
    private var authApi: AuthApi = AuthApiImpl()
    
    func auth(username: String, password: String, completion: @escaping (AuthResponse) -> Void) {
        if username.isEmpty {
            usernameField = FieldModel(value: usernameField.value, error: "Enter Email, Phone number, @nickname")
            return
        }
        if password.isEmpty {
            passwordField = FieldModel(value: passwordField.value, error: "Enter your password")
            return
        }
        
        Task {
            do {
                let response = try await authApi.auth(name: username, password: password)
                UserDefaults.standard.set(response.result?.pageId ?? -1, forKey: "page_id")
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                usernameField = FieldModel(value: usernameField.value, error: "error \(error.localizedDescription)")
            }
        }
    }
    
    func register(username: String, email: String, password: String, completion: @escaping (RegisterResponse) -> Void) {
        if username.isEmpty {
            usernameField = FieldModel(value: usernameField.value, error: "Enter @nickname")
            return
        }
        if email.isEmpty {
            emailField = FieldModel(value: usernameField.value, error: "Enter Email")
            return
        }
        if password.isEmpty {
            passwordField = FieldModel(value: passwordField.value, error: "Enter your password")
            return
        }
        
        Task {
            do {
                let response = try await authApi.register(nickname: username, emailOrPhone: email, password: password)
                UserDefaults.standard.set(response.result, forKey: "page_id")
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print("error response \(error)")
                usernameField = FieldModel(value: usernameField.value, error: "error \(error.localizedDescription)")
            }
        }
    }
    
}

struct FieldModel {
    let value: String
    let error: String?
}
