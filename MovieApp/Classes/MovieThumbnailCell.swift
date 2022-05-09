//
//  MovieThumbnailCell.swift
//  MovieApp
//
//  Created by Paula on 18.04.2022..
//

import Foundation
import UIKit
import MovieAppData


class MovieThumbnailCell: UICollectionViewCell {
    
    private var myMovie: MovieModel!
    private var movieThumbnail: UIImageView!
    private var favoritesButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createViews()
        styleViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){
        movieThumbnail = UIImageView()
        addSubview(movieThumbnail)
        
        favoritesButton = UIButton()
        addSubview(favoritesButton)
    }
    
    func styleViews(){
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .white
        
        favoritesButton.layer.cornerRadius = 16
        favoritesButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favoritesButton.backgroundColor = Utils.hexStringToUIColor(hex: "#0B253F").withAlphaComponent(0.6)
        favoritesButton.backgroundColor = Utils.hexStringToUIColor(hex: "#0B253F").withAlphaComponent(0.6)
        favoritesButton.clipsToBounds = true
        favoritesButton.tintColor = .white
        favoritesButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
    }
    
    @objc func addToFavorites(e: AnyObject) {
        //handle adding to favorites
        print("added")
        favoritesButton.isSelected = !favoritesButton.isSelected
        //myMovie.favorite = !myMovie.favorite
    }
    
    func layout() {
        movieThumbnail.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        favoritesButton.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(9)
            make.width.height.equalTo(32)
        }
    }
    
    func loadData(movie : MovieModel) {
        myMovie = movie
        let url = URL(string: movie.imageUrl)
        let data = try? Data(contentsOf: url!)
        movieThumbnail.image = UIImage(data: data!)
        //favoritesButton.isSelected = myMovie.favorite
    }
}
