import Foundation

struct Response: Decodable{
    let articles: [Article]
}

struct Article: Decodable{
    let title: String?
}
