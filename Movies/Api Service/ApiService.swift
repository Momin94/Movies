import UIKit
import Alamofire

class ApiService: NSObject {
    static let shareInstance = ApiService()
    
    func getAllMovies(url :URL, callback :@escaping (ResultModel) -> ()) {
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1").response { response in
            if let data = response.data {
                do {
                    let movieResponse = try JSONDecoder().decode(ResultModel.self, from: data)
                    callback(movieResponse)
                } catch let err {
                    print(err)
                }
            }
        }
        
        
    }
    
    
    
    
}



