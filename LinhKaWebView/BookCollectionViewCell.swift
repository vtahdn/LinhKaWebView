//
//  BookCollectionViewCell.swift
//  LinhKaWebView
//
//  Created by macbook on 10/12/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    
    let cellWidth: CGFloat = 80
    let labelHeight: CGFloat = 48
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    // Inside frame.
    override func intrinsicContentSize() -> CGSize {
        
        return CGSizeMake(cellWidth, cellWidth + labelHeight)
        
    }
    
    // Add images and labels
    func addSubviews() {
        
        if imageView == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, cellWidth, cellWidth))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
        }
        
        if nameLabel == nil {
            nameLabel = UILabel(frame: CGRectMake(0, cellWidth, cellWidth, labelHeight))
            nameLabel.textAlignment = .Center
            nameLabel.textColor = UIColor(white: 0.9, alpha: 1)
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(12)
            contentView.addSubview(nameLabel)
        }
    }
    
    // Selected border
    override var selected: Bool {
        didSet {
            imageView.layer.borderWidth = selected ? 2 : 0
        }
    }
    
    
    
    
    
    
}
