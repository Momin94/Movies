//
//  ProjectConstants.swift
//  Movies
//
//  Created by momin on 15/10/2021.
//

import Foundation

public class Constants {
    static let shareInstance = Constants()

    var cellName: String = "MovieCells"
    var baseAPI: String = "https://api.themoviedb.org/3/movie/popular?"
    var APIkey: String = "api_key=4c4170e285c8fd140fb81350cf566a45"
    var APIParams: String = "&page=1"

    func getCellName() -> String { return cellName }
    func getBaseAPI() -> String { return baseAPI }
    func getAPIKey() -> String { return APIkey }
    func getAPIParams() -> String { return APIParams }
}
