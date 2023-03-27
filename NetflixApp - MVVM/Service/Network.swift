//
//  Network.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 18.03.2023.
//

import Foundation
protocol MovieListServiceProtocol {
    func fetchMovies(onSuccess: @escaping ([Movie])-> Void, onFailure: @escaping (String) -> Void)
    func fetchTopMovies(onSuccess: @escaping ([Movie]) -> Void, omFailure: @escaping (String)->Void)
}

class MovieListService: MovieListServiceProtocol {
    func fetchMovies(onSuccess: @escaping ([Movie]) -> Void, onFailure: @escaping (String) -> Void) {
        guard let url = URL(string: NetworkConstans.MovieListApi.MovieListApi()) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                onFailure(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                onFailure("No data received")
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8) ?? "")
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                onSuccess(results.results)
            } catch let error {
                print(error)
                onFailure("Failed to decode data")
            }
        }
        task.resume()
    }
    func fetchTopMovies(onSuccess: @escaping ([Movie]) -> Void, omFailure onFailure: @escaping (String) -> Void) {
        guard let url = URL(string: NetworkConstans.MovieListTopApi.MovieListApiTop()) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                onFailure(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                onFailure("No data received")
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8) ?? "")
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                onSuccess(results.results)
            } catch let error {
                print(error)
                onFailure("Failed to decode data")
            }
        }
        task.resume()
    }
}

