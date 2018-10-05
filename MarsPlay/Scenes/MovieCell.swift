//
//  GameCell.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    lazy var posterView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.flatWhite
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "placeholder")
        return imageView
    }()
    
    lazy var titlelabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.helveticaBold.of(14)
        return label
    }()
    
    lazy var yearsLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helveticaBold.of(14)
        return  label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.backgroundColor = UIColor.flatWhite
        layer.cornerRadius = 10
        layer.masksToBounds = true
        self.contentView.addSubview(posterView)
        self.contentView.addSubview(titlelabel)
        self.contentView.addSubview(yearsLabel)
    }
    
    func setUpConstraints() {
        posterView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(self.contentView.frame.height - 70)
        }
        
        titlelabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(12)
            make.top.equalTo(posterView.snp.bottom).offset(2)
        }
        
        yearsLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(12)
            make.top.equalTo(titlelabel.snp.bottom).offset(2)
            make.bottom.greaterThanOrEqualToSuperview().inset(8)
        }
    }
}

// methods
extension MovieCell {
    func setUpData(_ movie: Movie) {
        self.titlelabel.text = movie.title
        setYear(movie.year ?? "")
        if let url = URL(string: movie.poster ?? "" ) {
            self.posterView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
        }
    }
    
    func setYear(_ year: String) {
        guard let movieYear = Int(year) else { return }
        let date = Date()
        let calendar = Calendar.current
        let presentYear = calendar.component(.year, from: date)
        let diffyear = presentYear - movieYear
        
        if diffyear > 1 {
            self.yearsLabel.text = "\(diffyear) years ago"
        }  else {
            self.yearsLabel.text = "\(diffyear) year ago"
        }
        
    }
}
