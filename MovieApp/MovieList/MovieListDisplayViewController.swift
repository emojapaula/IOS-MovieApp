//
//  MovieListDisplayViewController.swift
//  MovieApp
//
//  Created by Paula on 11.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MovieListDisplayViewController: UIViewController{
    
    public var scrollView: UIScrollView!
    public var mainView: UIStackView!

    var movieGroupList: [MovieGroup : [MovieModel]] = [:]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        layout()
        styleViews()
    }
    
    func createViews(){
        
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        mainView = UIStackView()
        scrollView.addSubview(mainView)
    }
    
    func styleViews(){
        mainView.axis = .vertical
        mainView.alignment = .fill
        mainView.distribution = .equalSpacing
        mainView.spacing = 43
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true

    }
    
    func layout(){
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            
        }
        
        mainView.snp.makeConstraints{
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(18)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview()
        }
        mainView.arrangedSubviews.forEach({ $0.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        } })
    }
    
    func loadData(groups: [MovieGroup : [MovieModel]]) {
        movieGroupList = groups
       
        for group in groups {
            let groupView = GroupView()
            groupView.loadData(group: group.key, movies: group.value)
            mainView.addArrangedSubview(groupView)
            //za svaku grupu stvoriti njen view
            //let movieGroup = CategoryView(group: .popular)
        }
        
        
    }
}
