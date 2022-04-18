//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Paula on 23.03.2022..
//

import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController, UIScrollViewDelegate{

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var scrollView: UIScrollView!
    private var imageView: UIImageView!
    private var movieUserScoreValue: UILabel!
    private var movieUserScoreValuePercentage: UILabel!
    private var movieUserScoreLabel: UILabel!
    private var movieTitle: UILabel!
    private var movieYear: UILabel!
    private var movieDateAndCountry: UILabel!
    private var movieGenre: UILabel!
    private var movieDuration: UILabel!
    private var favoritesIcon: UIImage!
    private var favoritesButton: UIButton!
    private var detailsView: UIView!
    private var movieOverviewLabel: UILabel!
    private var movieOverview: UILabel!
    private var crewView: UIView!
    
    let movieCrew = [
                (name: "Lauren Schmidt", role: "Creator", nameComponent: UILabel(), roleComponent: UILabel()),
                (name: "Andrzej Sapkowski", role: "Author", nameComponent: UILabel(), roleComponent: UILabel()),
                (name: "Alik Sakharov", role: "Director", nameComponent: UILabel(), roleComponent: UILabel()),
                (name: "Mike Ostrowski", role: "Producer", nameComponent: UILabel(), roleComponent: UILabel()),
                (name: "Jean-Philippe Gossart", role: "Cinematographer", nameComponent: UILabel(), roleComponent: UILabel()),
                (name: "Gavin Struthers", role: "Cinematographer", nameComponent: UILabel(), roleComponent: UILabel())
            ]
           
    func styleViews() {
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        movieUserScoreValue.text = "84"
        movieUserScoreValue.textColor = .white
        movieUserScoreValue.font = UIFont(name: "ProximaNova-Bold", size: 15)
        
        movieUserScoreValuePercentage.text = "%"
        movieUserScoreValuePercentage.textColor = .white
        movieUserScoreValuePercentage.font = UIFont(name: "ProximaNova-Bold", size: 9)
        
        movieUserScoreLabel.text = "User Score"
        movieUserScoreLabel.textColor = .white;
        movieUserScoreLabel.font = UIFont(name: "ProximaNova-Bold", size: 14)
        
        movieTitle.text = "Witcher"
        movieTitle.textColor = .white;
        movieTitle.font = UIFont(name: "ProximaNova-Extrabld", size: 24)
        
        movieYear.text = "(2019)"
        movieYear.textColor = .white;
        movieYear.font = UIFont(name: "ProximaNova-Regular", size: 24)
        
        movieDateAndCountry.text = "12/20/2019 (US)"
        movieDateAndCountry.textColor = .white;
        movieDateAndCountry.font = UIFont(name: "ProximaNova-Regular", size: 14)
        
        movieGenre.text = "Action, Adventure, Drama, Fantasy"
        movieGenre.textColor = .white;
        movieGenre.font = UIFont(name: "ProximaNova-Regular", size: 14)
        
        movieDuration.text = "2 seasons"
        movieDuration.textColor = .white;
        movieDuration.font = UIFont(name: "ProximaNova-Bold", size: 14)
        
        favoritesButton.layer.cornerRadius = 20
        favoritesButton.backgroundColor = UIColor.darkGray
        favoritesButton.setImage(favoritesIcon, for: .normal)
        favoritesButton.tintColor = .white
        favoritesButton.addTarget(self, action: #selector(self.addToFavorites), for: .touchUpInside)
        
        movieOverviewLabel.text = "Overview"
        movieOverviewLabel.textColor = .black;
        movieOverviewLabel.font = UIFont(name: "ProximaNova-Extrabld", size: 20)
        
        movieOverview.text = "Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts."
        movieOverview.textColor = .black;
        movieOverview.numberOfLines = 3
        movieOverview.font = UIFont(name: "ProximaNova-Regular", size: 14.0)
    }
    
    @objc func addToFavorites(e: AnyObject) {
        //handle adding to favorites
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createViews()
        styleViews()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        renderCrew()
        layout()
    }
    
    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        imageView = UIImageView(image: UIImage(named: "witcherThumbnail"))
        scrollView.addSubview(imageView)
        
        movieUserScoreValue = UILabel()
        movieUserScoreValuePercentage = UILabel()
        movieUserScoreLabel = UILabel()
        imageView.addSubview(movieUserScoreValue)
        imageView.addSubview(movieUserScoreValuePercentage)
        imageView.addSubview(movieUserScoreLabel)
        
        movieTitle = UILabel()
        movieYear = UILabel()
        imageView.addSubview(movieTitle)
        imageView.addSubview(movieYear)
        
        movieDateAndCountry = UILabel()
        imageView.addSubview(movieDateAndCountry)
        
        
        movieGenre = UILabel()
        movieDuration = UILabel()
        imageView.addSubview(movieGenre)
        imageView.addSubview(movieDuration)
        
        favoritesIcon = UIImage(systemName: "star")
        favoritesButton = UIButton()
        imageView.addSubview(favoritesButton)
        
        detailsView = UIView()
        scrollView.addSubview(detailsView)
        
        movieOverviewLabel = UILabel()
        movieOverview = UILabel()
        detailsView.addSubview(movieOverviewLabel)
        detailsView.addSubview(movieOverview)
        
        crewView = UIView()
       scrollView.addSubview(crewView)

    }
    
    private func renderCrew() {

        for crewMember in movieCrew {
            let name = crewMember.nameComponent
            name.text = crewMember.name
            name.textColor = .black
            name.font = UIFont(name: "ProximaNova-Extrabld", size: 14)
            let role = crewMember.roleComponent
            role.text = crewMember.role
            role.textColor = .black
            role.font = UIFont(name: "ProximaNova-Regular", size: 14)
            crewView.addSubview(name)
            crewView.addSubview(role)
        }
    }
    
    
    private func layout() { 
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalTo(crewView.snp.bottom)
        }

        imageView.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview()
            maker.height.equalTo(view).multipliedBy(0.5)
            maker.width.equalToSuperview()
        }

        movieUserScoreValue.snp.makeConstraints{(maker) in
            maker.leading.equalToSuperview().offset(30)
            maker.top.equalToSuperview().offset(imageView.frame.height * 0.6)
        }
        
        movieUserScoreValuePercentage.snp.makeConstraints{(maker) in
            maker.leading.equalTo(movieUserScoreValue.snp.trailing)
            maker.bottom.equalTo(movieUserScoreValue).offset(-2)
        }
        
        movieUserScoreLabel.snp.makeConstraints{(maker) in
            maker.leading.equalTo(movieUserScoreValuePercentage.snp.trailing).offset(8)
            maker.top.equalTo(movieUserScoreValue)
        }

        movieTitle.snp.makeConstraints{(maker) in
            maker.leading.equalToSuperview().offset(18)
            maker.top.equalTo(movieUserScoreLabel).offset(imageView.frame.height * 0.15)
        }
        
        movieYear.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieTitle)
            maker.leading.equalTo(movieTitle.snp.trailing).offset(8)
        }

        movieDateAndCountry.snp.makeConstraints{(maker) in
            maker.leading.equalTo(movieTitle)
            maker.top.equalTo(movieTitle.snp.bottom).offset(3)
        }

        movieGenre.snp.makeConstraints{(maker) in
            maker.leading.equalTo(movieTitle)
            maker.top.equalTo(movieDateAndCountry.snp.bottom).offset(3)
        }
        
        movieDuration.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieGenre)
            maker.leading.equalTo(movieGenre.snp.trailing).offset(8)
        }
        
        favoritesButton.snp.makeConstraints { (maker) in
            maker.height.equalTo(32)
            maker.width.equalTo(32)
            maker.leading.equalTo(movieTitle)
            maker.top.equalTo(movieGenre.snp.bottom).offset(10)
        }
        
        detailsView.snp.makeConstraints{(maker) in
            maker.top.equalTo(imageView.snp.bottom)
            maker.leading.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(view).multipliedBy(0.25)
            //maker.bottom.equalTo(movieCrew[3].roleComponent.snp.bottom).offset(390)
        }
    
        movieOverviewLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview().offset(18)
        }
        
        movieOverview.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieOverviewLabel.snp.bottom).offset(10)
            maker.leading.equalToSuperview().offset(16)
            maker.trailing.equalToSuperview().offset(-27)
        }
        
        crewView.snp.makeConstraints {
            $0.top.equalTo(detailsView.snp.bottom)
            $0.bottom.greaterThanOrEqualToSuperview()
            $0.bottom.equalTo(movieCrew[3].roleComponent.snp.bottom).offset(390)
            $0.width.equalToSuperview()
        }
        
        movieCrew[0].nameComponent.snp.makeConstraints{
            $0.top.equalTo(movieOverview.snp.bottom).offset(24)
            $0.leading.equalTo(movieOverview.snp.leading)
            $0.width.equalToSuperview().dividedBy(3).offset(-20)
        }
        
        movieCrew[3].nameComponent.snp.makeConstraints{
            $0.top.equalTo(movieCrew[0].roleComponent.snp.bottom).offset(10)
            $0.leading.equalTo(movieCrew[0].roleComponent.snp.leading)
            $0.width.equalTo(view.snp.width).dividedBy(3).offset(-20)
        }

        for (index, person) in movieCrew.enumerated() {
            person.roleComponent.snp.makeConstraints{
                $0.top.equalTo(person.nameComponent.snp.bottom).offset(5)
                $0.leading.equalTo(person.nameComponent.snp.leading)
            }
            if (index != 0 && index != 3) {
                person.nameComponent.snp.makeConstraints{
                    $0.top.equalTo(movieCrew[index-1].nameComponent.snp.top)
                    $0.leading.equalTo(movieCrew[index-1].nameComponent.snp.trailing).offset(10)
                    $0.width.equalTo(view.snp.width).dividedBy(3).offset(-20)
                }
            }
        }
    }
}


