//
//  MovieConstracts.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 18.03.2023.
//

import Foundation
protocol MovieListViewModelProtocol {
    var delegate:MovieListViewModelDelegate? {get set}
    func load()
    func loadTopMovie()
}
enum MovieListViewModelOutput {
    case showMovie([Movie])
    case error(String)
}
protocol MovieListViewModelDelegate {
    func handleOutput(_ outPut: MovieListViewModelOutput)
}

