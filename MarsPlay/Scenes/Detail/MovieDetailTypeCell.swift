//
//  MovieDetailTypeCell.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit

class MovieDetailTypeCell: UITableViewCell {
    
    lazy var typelabel: UILabel = {
        var label = UILabel()
        label.text = "Type"
        label.font = Fonts.helveticaBold.of(16)
        return label
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
        self.contentView.addSubview(typelabel)
    }
    
    func setUpData(_ movie: Movie) {
        self.typelabel.text = movie.type ?? ""
        
    }
    
    func setUpConstraints() {
        typelabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
    }
}
