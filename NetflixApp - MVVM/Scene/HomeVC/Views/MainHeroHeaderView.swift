//
//  MainHeroHeaderView.swift
//  NetflixApp - MVVM
//
//  Created by Fatih on 5.02.2023.
//

import UIKit

class MainHeroHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createUI() {
        lazy var heroImageView = UIImageView()
        heroImageView.image = UIImage(named: "great")
        addSubview(heroImageView)
        heroImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(screenHeight * 0.35)
        }
        addGradient()
        lazy var playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = 10
        addSubview(playButton)
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.3 * screenHeight)
            make.left.equalToSuperview().offset(0.2 * screenWidth)
            make.width.equalTo(100)
        }
        lazy var downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.layer.borderColor = UIColor.white.cgColor
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.cornerRadius = 10
        addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.3 * screenHeight)
            make.right.equalToSuperview().offset(-0.2 * screenWidth)
            make.width.equalTo(100)
        }
        
        
    }
    private func addGradient() {
        lazy var gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        layer.addSublayer(gradientLayer)
    }
}
