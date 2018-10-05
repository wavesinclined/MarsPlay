//
//  GameDetailAvatarCell.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit

class MovieDetailAvatarCell: UITableViewCell {
    lazy var posterView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.flatWhite
        imageView.image = #imageLiteral(resourceName: "placeholder")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.contentView.addSubview(posterView)
    }
    
    func setUpData(_ movie: Movie) {
        if let url = URL(string: movie.poster ?? "") {
            posterView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
        }
    }
    
    func setUpConstraints() {
        posterView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview().inset(16)
            make.height.equalTo(260)
        }
    }
}
