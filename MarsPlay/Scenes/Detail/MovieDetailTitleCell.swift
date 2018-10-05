//
//  GameDetailTitleCell.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit

class MovieDetailTitleCell: UITableViewCell {
    
    lazy var titlelabel: UILabel = {
        var label = UILabel()
        label.text = "Title"
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
        self.contentView.addSubview(titlelabel)
    }
    
    func setUpData(_ movie: Movie) {
        self.titlelabel.text = movie.title ?? ""
        
    }
    
    func setUpConstraints() {
        titlelabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
        
    }
    
}
