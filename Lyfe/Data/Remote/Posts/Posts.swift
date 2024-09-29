import Foundation

protocol PostsApi {
    func createTextPost(body: TextPostBody) async throws -> PostResponse
}

class PostsApiImpl: PostsApi {
    
    func createTextPost(body: TextPostBody) async throws -> PostResponse {
        guard let url = URL(string: ApiData.apiUrl + .createPost) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
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
            let apiResponse = try JSONDecoder().decode(PostResponse.self, from: data)
            return apiResponse
        } catch {
            return PostResponse(errors: ["Something went wrong!"])
        }
    }
    
}

