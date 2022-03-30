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
    
    private let scrollView = UIScrollView()
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    private lazy var ImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "witcherThumbnail"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var movieUserScoreValue : UILabel = {
        let label = UILabel()
        label.text = "76"
        label.textColor = .white
        label.font = UIFont(name: "ProximaNova-Bold", size: 15)
        return label
    }()
    
    private lazy var movieUserScoreValuePercentage : UILabel = {
        let label = UILabel()
        label.text = "%"
        label.textColor = .white
        label.font = UIFont(name: "ProximaNova-Bold", size: 9)
        return label
    }()
    
    private lazy var movieUserScoreLabel : UILabel = {
        let label = UILabel()
        label.text = "User Score"
        label.textColor = .white;
        label.font = UIFont(name: "ProximaNova-Bold", size: 14)
        return label
    }()
    
    private lazy var movieTitle : UILabel = {
        let label = UILabel()
        label.text = "Witcher"
        label.textColor = .white;
        label.font = UIFont.systemFont(ofSize: 24, weight: .black)
        label.font = UIFont(name: "ProximaNova-Extrabld", size: 24)
        return label
    }()
    
    private lazy var movieYear : UILabel = {
        let label = UILabel()
        label.text = "(2019)"
        label.textColor = .white;
        label.font = UIFont(name: "ProximaNova-Regular", size: 24)
        return label
    }()
    
    private lazy var movieDateAndCountry : UILabel = {
        let label = UILabel()
        label.text = "12/20/2019 (US)"
        label.textColor = .white;
        label.font = UIFont(name: "ProximaNova-Regular", size: 14)
        return label
    }()

    private lazy var movieGenre : UILabel = {
        let label = UILabel()
        label.text = "Action, Adventure, Drama, Fantasy"
        label.textColor = .white;
        label.font = UIFont(name: "ProximaNova-Regular", size: 14)
        return label
    }()

    private lazy var movieDuration : UILabel = {
        let label = UILabel()
        label.text = "2 seasons"
        label.textColor = .white;
        label.font = UIFont(name: "ProximaNova-Bold", size: 14)
        return label
    }()
    
    @objc func addToFavorites(e: AnyObject) {
            //handle adding to favorites
        }

    
    let favoritesIcon = UIImage(systemName: "star.fill")

    private lazy var favoritesButton: UIButton = {
        let circle = UIButton()
        circle.layer.cornerRadius = 20
        circle.backgroundColor = UIColor.darkGray
        circle.setImage(favoritesIcon, for: .normal)
        circle.tintColor = .white
        circle.addTarget(self, action: #selector(self.addToFavorites), for: .touchUpInside)
        return circle
    }()

    private lazy var DetailsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var movieOverviewLabel : UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.textColor = .black;
        label.font = UIFont(name: "ProximaNova-Extrabld", size: 20)
        return label
    }()
    
    private lazy var movieOverview : UILabel = {
        let label = UILabel()
        label.text = "Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts."
        label.textColor = .black;
        label.numberOfLines = 3
        let font = UIFont(name: "ProximaNova-Regular", size: 14.0)
        label.font = font
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        layout()

    }
    
    private func layout() {
        
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints{(maker) in
            maker.edges.equalTo(view)
        }

        scrollView.addSubview(ImageView)
        
        ImageView.snp.makeConstraints{ (maker) in
            maker.top.equalToSuperview()
            maker.height.equalTo(screenSize.height / 2)
            maker.width.equalTo(screenSize.width)
        }
        
        ImageView.addSubview(movieUserScoreValue)
        ImageView.addSubview(movieUserScoreValuePercentage)
        ImageView.addSubview(movieUserScoreLabel)
        
        movieUserScoreValue.snp.makeConstraints{(maker) in
            maker.left.equalToSuperview().offset(screenSize.width * 0.086)
            maker.top.equalToSuperview().offset(ImageView.frame.height * 0.6)
        }
        
        movieUserScoreValuePercentage.snp.makeConstraints{(maker) in
            maker.left.equalTo(movieUserScoreValue.snp.right)
            maker.bottom.equalTo(movieUserScoreValue)
        }
        
        movieUserScoreLabel.snp.makeConstraints{(maker) in
            maker.left.equalTo(movieUserScoreValuePercentage.snp.right).offset(screenSize.width * 0.02)
            maker.top.equalTo(movieUserScoreValue)
        }
        
        ImageView.addSubview(movieTitle)
        ImageView.addSubview(movieYear)
        
        movieTitle.snp.makeConstraints{(maker) in
            maker.left.equalToSuperview().offset(screenSize.width * 0.05)
            maker.top.equalTo(movieUserScoreLabel).offset(ImageView.frame.height * 0.15)
        }
        
        movieYear.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieTitle)
            maker.left.equalTo(movieTitle.snp.right).offset(screenSize.width * 0.02)
        }
        
        ImageView.addSubview(movieDateAndCountry)
        
        movieDateAndCountry.snp.makeConstraints{(maker) in
            maker.left.equalTo(movieTitle)
            maker.top.equalTo(movieTitle.snp.bottom).offset(3)
        }
        
        
        ImageView.addSubview(movieGenre)
        ImageView.addSubview(movieDuration)
        
        movieGenre.snp.makeConstraints{(maker) in
            maker.left.equalTo(movieTitle)
            maker.top.equalTo(movieDateAndCountry.snp.bottom).offset(3)
        }
        
        movieDuration.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieGenre)
            maker.left.equalTo(movieGenre.snp.right).offset(screenSize.width * 0.02)
        }
        
        ImageView.addSubview(favoritesButton)
        
        favoritesButton.snp.makeConstraints { (maker) in
            maker.height.equalTo(32)
            maker.width.equalTo(32)
            maker.left.equalTo(movieTitle)
            maker.top.equalTo(movieGenre.snp.bottom).offset(10)
        }
        
        //favoritesButton.addSubview(favoritesIcon)
        
        //icon.snp.makeConstraints { (maker) in
        //    maker.width.height.equalToSuperview().multipliedBy(0.5)
       //     maker.center.equalToSuperview()
       // }
        
        scrollView.addSubview(DetailsView)
        
        DetailsView.snp.makeConstraints{(maker) in
            maker.top.equalTo(ImageView.snp.bottom)
            maker.left.equalTo(view)
            maker.width.equalTo(screenSize.width)
            maker.height.equalTo(screenSize.height/4)
        }
        
        DetailsView.addSubview(movieOverviewLabel)
        DetailsView.addSubview(movieOverview)
        
        movieOverviewLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview().offset(screenSize.width * 0.05)
        }
        
        movieOverview.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieOverviewLabel.snp.bottom).offset(10)
            maker.left.equalTo(movieOverviewLabel)
            maker.left.equalTo(movieOverviewLabel.snp.left)
            maker.right.equalTo(DetailsView.snp.right).offset(screenSize.width * -0.05)

        }
        
        
   
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


