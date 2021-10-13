import UIKit
import Alamofire

class ApiService: NSObject {
    //static let shareInstance = ApiService()
    var movieArray = [MovieResults]()
    weak var movieViewController: MoviesTableViewController?
    
    func getAllMovies() {
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1").response { response in
            if let data = response.data {
                do {
                    let movieResponse = try JSONDecoder().decode(ResultModel.self, from: data)
                    if let results = movieResponse.results {
                        self.movieArray.append(contentsOf: results)
                    }
                    DispatchQueue.main.async {
                        self.movieViewController?.movieTableView.reloadData()
                    }
                } catch let err {
                    print(err)
                }
            }
        }
    }
}



