//
//  NetworkConstants.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 18.03.2023.
//

import Foundation
final class NetworkConstans {
    enum MovieListApi: String {
        case pathURL = "https://api.themoviedb.org/3/movie/"
        case genreURL = "/popular"
        case apiKey = "?api_key=7449b8e0901923de98300585d22d2be7"
        case language = "&language=en-US&page=1"
        
        static func MovieListApi() -> String {
            return "\(pathURL.rawValue)\(genreURL.rawValue)\(apiKey.rawValue)\(language.rawValue)"
        }
    }
}
