//
//  MovieCell.swift
//  MovieApp
//
//  Created by Paula on 11.04.2022..
//

import UIKit
import MovieAppData

class MovieCell: UICollectionViewCell {
    
    private var movieContainer: UIView!
    private var movieThumbnail: UIImageView!
    private var movieTitleLabel: UILabel!
    private var movieDescription: CustomUILabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createViews()
        styleViews()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func createViews() {
        movieContainer = UIView()
        addSubview(movieContainer)
        
        movieTitleLabel = UILabel()
        movieContainer.addSubview(movieTitleLabel)
        
        movieDescription = CustomUILabel()
        movieContainer.addSubview(movieDescription)
        
        movieThumbnail = UIImageView()
        movieContainer.addSubview(movieThumbnail)
    }
    
    func styleViews() {
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.1
        movieContainer.backgroundColor = .white
        movieContainer.layer.cornerRadius = 20
        movieContainer.layer.masksToBounds = true
        
        movieTitleLabel.textColor = .black
        movieTitleLabel.font = UIFont(name: "ProximaNova-Bold", size: 20)
        movieTitleLabel.numberOfLines = 0
        
        movieDescription.textColor = Utils.hexStringToUIColor(hex: "#828282")
        movieDescription.font = UIFont(name: "ProximaNova-Regular", size: 16)
        movieDescription.numberOfLines = 5
        movieDescription.lineBreakMode = .byTruncatingTail
    }
    
    func layout() {
        movieContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        movieTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalTo(movieThumbnail.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        movieThumbnail.snp.makeConstraints{
            $0.leading.top.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(3)
        }
        
        movieDescription.snp.makeConstraints{
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(movieTitleLabel)
            $0.trailing.equalTo(movieTitleLabel)
            $0.bottom.equalToSuperview().offset(-19)
        }
    }
    
    func configure( movie: MovieModel) {
        movieTitleLabel.text = movie.title + " (" + String(movie.year) + ")"
        
        let url = URL(string: movie.imageUrl)
        let data = try? Data(contentsOf: url!)
        movieThumbnail.image = UIImage(data: data!)
        
        let attributedString = NSMutableAttributedString(string: movie.description)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.9
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        movieDescription.attributedText = attributedString
    }
}


