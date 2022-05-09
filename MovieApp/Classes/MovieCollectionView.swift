//
//  MovieCollectionView.swift
//  MovieApp
//
//  Created by Paula on 18.04.2022..
//


import Foundation
import SnapKit
import UIKit
import MovieAppData

class MovieCollectionView: UIView {
    
    let cellIdentifier = "cellId"
    let edgeInsets = UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0)
    var movieList : [MovieModel] = []
    var movieCollection: UICollectionView!
    let abstractCategories = ["Popular", "Trending", "Top Rated"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        layout()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func createViews() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = edgeInsets
        movieCollection = UICollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: bounds.width,
                height: bounds.height),
            collectionViewLayout: flowLayout)
        
        movieCollection.register(MovieThumbnailCell.self, forCellWithReuseIdentifier: cellIdentifier)
        movieCollection.dataSource = self
        movieCollection.delegate = self
        movieCollection.showsHorizontalScrollIndicator = false
        addSubview(movieCollection)
    }
    
    func styleViews(){
        backgroundColor = .white
        movieCollection.backgroundColor = .white
    }
    
    func layout() {
        movieCollection.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        movieCollection.collectionViewLayout.invalidateLayout()
    }
    
    func loadData(group : MovieGroup, filter: String) {
        movieList = []
        for movie in Movies.all() {
            if (movie.group.contains(group)) {
                if(Utils.genreToString(genre: movie.genre) == filter || abstractCategories.contains( Utils.groupToString(group: group))) {
                    movieList.append(movie)
                }
            }
        }
        movieCollection.reloadData()
    }
}

extension MovieCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as?
                MovieThumbnailCell else {
                    return UICollectionViewCell()
                }
        movieCell.loadData(movie: movieList[indexPath.row])
        return movieCell
    }
}

extension MovieCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Logic when cell is selected
    }
}

extension MovieCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 122, height: 180)
    }
}
