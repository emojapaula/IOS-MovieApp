//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Paula on 23.03.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MovieListViewController: UIViewController{
    
    var mainView: UIView!
    var searchBar: SearchBarView!
    
    var controllerContainer: UIView!
    var movieListDisplayViewController: MovieListDisplayViewController!
    var movieListSearchViewController: MovieListSearchViewController!
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        layout()
            fillViewData()
    
    }
    
    
    func buildViews(){

        mainView = UIView()
        movieListDisplayViewController = MovieListDisplayViewController()
        movieListSearchViewController = MovieListSearchViewController()
        
        movieListSearchViewController.view.isHidden = true
        
        addChild(movieListDisplayViewController)
        addChild(movieListSearchViewController)
        searchBar = SearchBarView()
        searchBar.delegate = self
        
        mainView.backgroundColor = .white

        controllerContainer = UIView()
        
        view.addSubview(mainView)
        mainView.addSubview(searchBar)
        mainView.addSubview(controllerContainer)
        controllerContainer.addSubview(movieListDisplayViewController.view)
        controllerContainer.addSubview(movieListSearchViewController.view)
    }
    
    func layout(){
        
        mainView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchBar.snp.makeConstraints{
            $0.leading.top.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        controllerContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        movieListDisplayViewController.view.snp.makeConstraints{
            $0.edges.equalTo(controllerContainer)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        movieListSearchViewController.view.snp.makeConstraints{
            $0.edges.equalTo(controllerContainer)
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func fillViewData() {
        let movies = Movies.all()
        let groups = MovieGroup.allCases.reduce([MovieGroup : [MovieModel]]()) { (dict, group) -> [MovieGroup : [MovieModel]] in
            var helperDictionary = dict
            helperDictionary[group] = movies.filter{ $0.group.contains(group) }

            return helperDictionary
        }
        

 
        movieListDisplayViewController.loadData(groups: groups)
        movieListSearchViewController.loadData(movies: movies)
    }

}

extension MovieListViewController: SearchBarDelegate{
    func switchViews(){
        movieListDisplayViewController.view.isHidden = !movieListDisplayViewController.view.isHidden
        movieListSearchViewController.view.isHidden = !movieListSearchViewController.view.isHidden
    }
}

