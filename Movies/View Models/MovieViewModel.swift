import Alamofire
import UIKit.UIImage

class MovieViewModel {
    var movieArray = [MovieResults]()
    weak var movieViewController: MoviesTableViewController?

    func getAllMoviesAF() {
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1").response { response in
            if let data = response.data {
                do { // error coming here
                    let movieResponse = try JSONDecoder().decode([MovieResults].self, from: data)
                    self.movieArray.append(contentsOf: movieResponse)
                    DispatchQueue.main.async {
                        self.movieViewController?.movieTableView.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            }
        }
    }

    func getAllMovies() {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1")!) { data, _, error in
            if error == nil {
                if let data = data {
                    do { // error coming here
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
            } else {
                print(error?.localizedDescription ?? "default value")
            }
        }.resume()
    }
}
