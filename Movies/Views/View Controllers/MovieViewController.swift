import SDWebImage
import UIKit

class MoviesTableViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet var movieTableView: UITableView!
    var movieViewModel = MovieViewModel()
    var movieCell = MovieCells()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.register(UINib(nibName: Constants.shareInstance.getCellName(),
                                      bundle: nil),
                                forCellReuseIdentifier: movieCell.getCellName())
        movieViewModel.getMovie { _ in
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
    }
}

// MARK: - Extension

extension MoviesTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.getCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shareInstance.getCellName(), for: indexPath) as? MovieCells

        if indexPath.row <= movieViewModel.movieArray.count {
            let modelMovie = movieViewModel.movieArray[indexPath.row]
            cell?.movieTitle.text = modelMovie.title
            let imageURL = URL(string: "\(Constants.shareInstance.getBaseImageUrl())" + (modelMovie.poster_path ?? ""))
            cell?.movieImage.sd_setImage(with: imageURL)
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "moviedetail") as? MovieDetailsViewController else {
            return
        }

        if indexPath.row <= movieViewModel.movieArray.count {
            let movieModel = movieViewModel.movieArray[indexPath.row]
            destinationController.movieModel = movieModel
            navigationController?.show(destinationController, sender: self)
        }
    }
}
