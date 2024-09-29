import Foundation

struct TextPostBody: Codable {
    let pageId: Int
    let explicitContent: Int
    let bestFriends: Bool
    let attributes: PostAtributes
    var publish: Bool = true
    var postType: Int = 1
}


struct PostAtributes: Codable {
    var text: String?
}

struct PostResponse: Codable {
    let errors: [String]?
}
