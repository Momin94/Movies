import UIKit

class MovieCells: UITableViewCell {
    // MARK: - Properties

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!

    // MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(movie: MovieResults) {
        movieTitle.text = movie.original_title
    }
}
