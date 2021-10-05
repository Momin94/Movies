import SDWebImage
import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieDate: UILabel!
    var movieGenreText: String?
    var movieTitleText: String?
    var movieOverviewText: String?
    var movieDateText: String?
    var movieImageText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        movieGenre?.text = movieGenreText
        movieTitle?.text = movieTitleText
        movieDate?.text = movieDateText
        movieOverview?.text = movieOverviewText
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageURL = URL(string: movieImageText!)

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
