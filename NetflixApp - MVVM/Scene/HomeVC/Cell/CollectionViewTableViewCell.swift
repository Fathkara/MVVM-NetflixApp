//
//  CollectionViewTableViewCell.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 5.02.2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var viewModel: MovieListViewModelProtocol?
    var arrMovie = [Movie]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.3, height: screenWidth * 0.45)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    public func configure(with Movies: [Movie]) {
        self.arrMovie = Movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

}

extension CollectionViewTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMovie.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        if let model = arrMovie[indexPath.row].poster_path {
            cell.configure(with: model)
        }
        
        
        cell.backgroundColor = .purple
        return cell
    }
}
