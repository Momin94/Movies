import UIKit

class ApiService: NSObject
{
    
    static let shareInstance = ApiService()
    var movieArray = [MovieResults]()
    weak var movieViewController : MoviesTableViewController?


    func getAllMovies()
    {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1")!)
    }
    
   

}
