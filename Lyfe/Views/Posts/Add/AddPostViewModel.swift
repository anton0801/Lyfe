import Foundation

class AddPostViewModel: ObservableObject {
    
    var postApi: PostsApi = PostsApiImpl()
    
    @Published var publishedPost = false
    @Published var uploadingPost = false
    
    @Published var errorAddPost = false
    
    func createTextPost(text: String, bestFriends: Bool, explicitContent: Bool) async throws {
        let addPostResult = try await postApi.createTextPost(body: TextPostBody(pageId: UserDefaults.standard.integer(forKey: "page_id"), explicitContent: explicitContent ? 1 : 0, bestFriends: bestFriends, attributes: PostAtributes(text: text)))
        if addPostResult.errors != nil {
            errorAddPost = true
        }
    }
    
}
