//
//  FilterButton.swift
//  MovieApp
//
//  Created by Paula on 18.04.2022..
//

import Foundation
import UIKit


class FilterButton : UIView {
    
    private var buttonContainer: UIView!
    
    var buttonLabel: UILabel!
    private var underlineView: UIView!
    private var filterLabel: String!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createViews()
        styleViewsUnselected()
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){        
        buttonContainer = UIView()
        addSubview(buttonContainer)
        
        buttonLabel = UILabel()
        addSubview(buttonLabel)
        
        underlineView = UIView()
        addSubview(underlineView)
    }
    
    func styleViewsSelected(){
        underlineView.backgroundColor = .black
        underlineView.isHidden = false
        
        isUserInteractionEnabled = true
        
        buttonLabel.textColor = .black;
        buttonLabel.font = UIFont(name: "ProximaNova-Bold", size: 18.0)
    }
    
    func styleViewsUnselected(){
        underlineView.isHidden = true
        
        isUserInteractionEnabled = true
        
        buttonLabel.textColor = Utils.hexStringToUIColor(hex: "#828282");
        buttonLabel.font = UIFont(name: "ProximaNova-Bold", size: 18.0)

    }

    func layout(){

        buttonLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }

        underlineView.snp.makeConstraints{
            $0.height.equalTo(3)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonLabel.snp.bottom).offset(4)
        }
    }
    
    func loadData(filterName: String, isSelected: Bool){
        filterLabel = filterName
        buttonLabel.text = filterName
        if(isSelected) {
            styleViewsSelected()
        }
    }
  
}

