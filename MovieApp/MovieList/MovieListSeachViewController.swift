//
//  MovieListSeachViewController.swift
//  MovieApp
//
//  Created by Paula on 11.04.2022..
//

import UIKit
import SnapKit

class MovieListSearch: UIViewController{
    
    public var mainView: UIView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
    }
    
    func buildViews(){
        mainView = UIView()
        mainView.backgroundColor = .blue
        
        view.addSubview(mainView)
    }
    
    func addConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
