//
//  MovieListSearchController.swift
//  MovieApp
//
//  Created by Paula on 11.04.2022..
//

import UIKit
import MovieAppData

class MovieListSearchViewController: UIViewController {
    let cellIdentifier = "cellId"
    let edgeInsets = UIEdgeInsets(top: 33, left: 0, bottom: 95, right: 0)
    var movieList: [MovieModel] = []
    var collection: UICollectionView!

    override func viewDidLoad() {
        view.backgroundColor = .white
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = edgeInsets
        collection = UICollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height),
            collectionViewLayout: flowLayout)
        collection.backgroundColor = .white
        view.addSubview(collection)
        collection.register(MovieCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.dataSource = self
        collection.delegate = self
        collection.showsVerticalScrollIndicator = false
    }
}
extension MovieListSearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as?
                MovieCell else {
                    return UICollectionViewCell()
                }
        movieCell.configure(movie: movieList[indexPath.row])
        return movieCell
    }
    
    func loadData(movies: [MovieModel]) {
        movieList = movies
        collection.reloadData()
        
    }
}
extension MovieListSearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Logic when cell is selected
    }
}

extension MovieListSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 170)
    }
}

