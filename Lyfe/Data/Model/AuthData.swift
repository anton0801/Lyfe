import Foundation

struct AuthData: Codable {
    var username: String
    var password: String
}

struct RegisterData: Codable {
    var username: String
    var email: String
    var password: String
}

struct RegisterResponse: Codable {
    let result: ResultData?
    let errors: [String]?
        
    struct ResultData: Codable {
        let message: String
    }
}

struct AuthResponse: Codable {
    let errors: [String]?
    let result: AuthResult?
}

struct AuthResult: Codable {
    let token: String
    let userId: Int
    let pageId: Int
}

struct ResultResponse: Codable {
    let message: String
}


