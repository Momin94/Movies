import SDWebImage
import UIKit

class MovieDetailsViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieDate: UILabel!

    var movieDetailViewModel: MovieViewModel!
    var index: Int = 0
    var imageText: String?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        movieGenre?.text = movieDetailViewModel.movieArray[index].vote_average?.description
        movieTitle?.text = movieDetailViewModel.movieArray[index].title
        movieDate?.text = movieDetailViewModel.movieArray[index].release_date
        movieOverview?.text = movieDetailViewModel.movieArray[index].overview
        imageText = "https://image.tmdb.org/t/p/w500/" + (movieDetailViewModel.movieArray[index].poster_path ?? "")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageURL = URL(string: imageText!)

        movieImage.sd_setImage(with: imageURL) { image, error, _, _ in
            if error != nil {
                // Failed to load image
                self.movieImage.image = UIImage(named: "TestImage.jpg")
            } else {
                // Successful in loading image
                self.movieImage.image = image
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
    }
}
