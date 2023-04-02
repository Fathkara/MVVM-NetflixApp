//
//  MovieListBuilder.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 18.03.2023.
//

import Foundation

class MovieListBuilder {
    static func make() ->  HomeViewController {
        let vc = HomeViewController()
        let viewModel = MovieListViewModel(service: MovieListService())
        vc.viewModel = viewModel 
        return vc
    }
}
