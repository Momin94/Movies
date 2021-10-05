import SDWebImage
import UIKit

class MoviesTableViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet var movieTableView: UITableView!
    var movieViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //bindViewModel()
        //    movieViewModel.movieArray.forEach(MovieResults in
        //    bind(MovieResults))
        movieTableView.register(UINib(nibName: "MovieCells", bundle: nil), forCellReuseIdentifier: "MovieCells")
        movieViewModel.movieViewController = self
        movieViewModel.getAllMoviesAF()
        
    }
}

// MARK: - Extension

extension MoviesTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.movieArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCells", for: indexPath) as? MovieCells
        let modelMovie = movieViewModel.movieArray[indexPath.row]
        cell?.movieTitle.text = modelMovie.title
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/" + (modelMovie.poster_path ?? ""))
        cell?.movieImage.sd_setImage(with: imageURL)
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationController = storyboard.instantiateViewController(withIdentifier: "moviedetail") as! MovieDetailsViewController

        let modelMovie = movieViewModel.movieArray[indexPath.row]

        destinationController.movieGenreText = modelMovie.vote_average?.description
        destinationController.movieDateText = modelMovie.release_date
        destinationController.movieOverviewText = modelMovie.overview
        destinationController.movieTitleText = modelMovie.title
        let imageURL = "https://image.tmdb.org/t/p/w500/" + (modelMovie.poster_path ?? "")
        destinationController.movieImageText = imageURL

        navigationController?.show(destinationController, sender: self)
    }
    
//    func bindViewModel() {
//            if let viewModel = movieViewModel {
//                viewModel.helloText.bind({ (helloText) in
//                    DispatchQueue.main.async {
//                        self.helloLabel.text = helloText
//                    }
//                })
//            }
//        }
    
}
