//
//  GroupView.swift
//  MovieApp
//
//  Created by Paula on 17.04.2022..
//

import Foundation
import UIKit
import MovieAppData

class GroupView: UIView {
    
    private var groupViewContainer: UIView!
    private var movieGroupLabel: UILabel!
    
    private var filterScrollView: UIScrollView!
    private var filterStackView: UIStackView!
    
    private var movieCollectionView: MovieCollectionView!
    private var movieGroup: MovieGroup!
    
    private var filterValue = "Drama"
    private var filterButton: FilterButton!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createViews()
        styleViews()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func createViews(){
        movieGroupLabel = UILabel()
        addSubview(movieGroupLabel)
        
        filterScrollView=UIScrollView()
        addSubview(filterScrollView)
        filterStackView = UIStackView()
        filterScrollView.addSubview(filterStackView)
        
        movieCollectionView = MovieCollectionView()
        addSubview(movieCollectionView)
    }
    
    func styleViews(){
        movieGroupLabel.textColor = Utils.hexStringToUIColor(hex: "#0B253F")
        movieGroupLabel.font = UIFont(name: "ProximaNova-Extrabld", size: 20)
        
        filterStackView.axis = .horizontal
        filterStackView.distribution = .fillProportionally
        filterStackView.spacing = 20
        filterScrollView.showsHorizontalScrollIndicator = false
        
        
    }
    
    func layout(){
        
        movieGroupLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
        }
        
        filterScrollView.snp.makeConstraints{
            $0.height.equalTo(40)
            $0.top.equalTo(movieGroupLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }

        filterStackView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(movieGroupLabel.snp.bottom).offset(8)
            $0.bottom.equalTo(movieCollectionView.snp.top).inset(20)
        }

        movieCollectionView.snp.makeConstraints{
            $0.top.equalTo(filterScrollView.snp.bottom)
            $0.trailing.bottom.equalToSuperview()
            $0.height.equalTo(220)
            $0.leading.equalToSuperview()
        }
    }
    
    
    func loadData(group: MovieGroup, movies: Array<MovieModel>){
        
        movieGroupLabel.text = Utils.groupToString(group: group)
        
        for filter in group.filters {
            var isSelected = false
            if (filter == group.filters[0]){
                isSelected = true
            }
            createButton(filter: filter, isSelected: isSelected)
        }
        movieGroup = group
        movieCollectionView.loadData(group: group,filter: filterValue)
    }
    
    
    
    func createButton(filter: MovieFilter, isSelected: Bool){
        filterButton = FilterButton()
        
        filterButton.loadData(filterName: Utils.filterToString(filter : filter), isSelected: isSelected)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        filterButton.addGestureRecognizer(tapGesture)
        filterStackView.addArrangedSubview(filterButton)
    }
    
    
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let button = (sender.view as? FilterButton)!
        chooseFilter(filterButton: button)
    }
    
    @objc func chooseFilter(filterButton: FilterButton) {
        for case let button as FilterButton in filterStackView.arrangedSubviews {
            button.styleViewsUnselected()
        }
        filterButton.styleViewsSelected()
        filterValue = filterButton.buttonLabel!.text!
        movieCollectionView.loadData(group: movieGroup, filter: filterValue)

    }
    
    
}
