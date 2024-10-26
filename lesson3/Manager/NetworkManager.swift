

import Foundation
import Alamofire

class NetworkManager{
    
    func getNews(completion: @escaping ([Article]) -> Void){
        
        let url = "https://newsapi.org/v2/everything"
        
        let parameters: Parameters = [
            "q": "tesla",
            "apiKey": "edd79271e928458c8d570cab46fa51c7"
        ]
        
        AF.request(url, parameters: parameters).response { response in
            guard response.error == nil,
                    let data = response.data else {
                return
            }
            
            guard let result = try? JSONDecoder().decode(Response.self, from: data) else { return }
            
            completion(result.articles)
        }
    }
    

    
}
