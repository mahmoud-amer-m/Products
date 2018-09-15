//
//  DeliveryCell.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation
import UIKit

class DeliveryCell: UITableViewCell {
    let deliveryImageView = UIImageView()
    let descriptionLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
        setupView()
    }
    
    func setupView() {
        deliveryImageView.backgroundColor = .clear
        deliveryImageView.image = UIImage(named: "productIcon")
        descriptionLabel.textColor = .black
        
        deliveryImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(deliveryImageView)
        contentView.addSubview(descriptionLabel)
        
        //MARK -- ImageView
        //Leading
        contentView.addConstraint(NSLayoutConstraint(item: deliveryImageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 8))
        //Center Vertical
        contentView.addConstraint(NSLayoutConstraint(item: deliveryImageView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
        //Width
        contentView.addConstraint(NSLayoutConstraint(item: deliveryImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        //Height
        contentView.addConstraint(NSLayoutConstraint(item: deliveryImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        
        //MARK -- Description Label
        //Leading
        contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: deliveryImageView, attribute: .trailing, multiplier: 1, constant: 8))
        //Trailing
        contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -8))
        //Bottom
        contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -8))
        //Top
        contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 8))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
