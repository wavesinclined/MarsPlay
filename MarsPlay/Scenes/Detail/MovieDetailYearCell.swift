//
//  MovieDetailYearCell.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit

class MovieDetailYearCell: UITableViewCell {
    
    lazy var yearlabel: UILabel = {
        var label = UILabel()
        label.text = "Year"
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
        self.contentView.addSubview(yearlabel)
    }
    
    func setUpData(_ movie: Movie) {
        self.yearlabel.text = movie.year ?? ""
        
    }
    
    func setUpConstraints() {
        yearlabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
        
    }
    
   
}
