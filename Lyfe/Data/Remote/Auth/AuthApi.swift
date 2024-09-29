import Foundation

protocol AuthApi {
    func auth(name: String, password: String) async throws -> AuthResponse
    func register(nickname: String, emailOrPhone: String, password: String) async throws -> RegisterResponse
}

class AuthApiImpl: AuthApi {
    
    func auth(name: String, password: String) async throws -> AuthResponse {
        guard let url = URL(string: ApiData.apiUrl + .authEndpoint) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let body = AuthData(username: name, password: password)
        do {
            let requestBody = try encoder.encode(body)
            request.httpBody = requestBody
        } catch {
            throw NSError(domain: "Invalid request body", code: -1, userInfo: nil)
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        
        do {
            let apiResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            return apiResponse
        } catch {
            return AuthResponse(errors: ["Something went wrong!"], result: nil)
        }
    }
    
    func register(nickname: String, emailOrPhone: String, password: String) async throws -> RegisterResponse {
        guard let url = URL(string: ApiData.apiUrl + .registerEndpoint) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let body = RegisterData(username: nickname, email: emailOrPhone, password: password)
        do {
            let requestBody = try encoder.encode(body)
            request.httpBody = requestBody
        } catch {
            throw NSError(domain: "Invalid request body", code: -1, userInfo: nil)
        }

        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        
        do {
            let apiResponse = try JSONDecoder().decode(RegisterResponse.self, from: data)
            return apiResponse
        } catch {
            return RegisterResponse(result: nil, errors: ["Something went wrong!"])
        }
    }
    
}
