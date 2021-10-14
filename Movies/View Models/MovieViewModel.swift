import Alamofire
import UIKit.UIImage

class MovieViewModel {
    // MARK: - Properties

    var movieArray = [MovieResults]()
    weak var movieViewController: MoviesTableViewController?

    // MARK: - Methods

    func getMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1")!

        ApiService.shareInstance.getAllMovies(url: url) { model in
            if let movies = model.results {
                self.movieArray.append(contentsOf: movies)
            }
            DispatchQueue.main.async {
                self.movieViewController?.movieTableView.reloadData()
            }
        }
    }

    func getCount() -> Int {
        return movieArray.count
    }
}
