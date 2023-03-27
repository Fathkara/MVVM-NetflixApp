//
//  HomeViewController.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 5.02.2023.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    
    private var tableView = UITableView()
    var viewModel: MovieListViewModel?
    var arrMovie = [Movie]()
    let sectionMovies: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        viewModel?.delegate = self
        viewModel?.load()
        viewModel?.loadTopMovie()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        let headerView = MainHeroHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.35))
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
extension HomeViewController: MovieListViewModelDelegate {
    func handleOutput(_ outPut: MovieListViewModelOutput) {
        switch outPut {
        case.showMovie(let movie):
            self.arrMovie = movie
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case.error(let error):
            print(error)
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionMovies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        switch indexPath.section {
        case Sections.tableViewSection.Popular.rawValue:
            cell.configure(with: arrMovie)
        case Sections.tableViewSection.TrendingTv.rawValue:
            cell.configure(with: arrMovie)
        default:
            break
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
