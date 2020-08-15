//
//  Cells.swift
//  PruebaElUniversal
//
//  Created by Ago Consultores on 14/08/20.
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCellNew_: UITableViewCell, UITextFieldDelegate {
    let sizes = Sizes.instance()
    let lTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackUniversal
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.layer.masksToBounds = true
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ivUrlImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
       
        return image
    }()
    
    let lSubtitleTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackUniversal
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.layer.masksToBounds = true
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        Utils._print("pantalla widthCell: \(self.contentView.frame.width) y \(frame.width)" );
        addSubview(lTitle)
        
        lTitle.backgroundColor = UIColor.white
        lTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
        lTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        lTitle.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        lTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(ivUrlImage)
        ivUrlImage.topAnchor.constraint(equalTo: lTitle.bottomAnchor, constant: sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
        ivUrlImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
        ivUrlImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
        ivUrlImage.heightAnchor.constraint(equalToConstant: sizes.SIZE_HEIGHT_IMAGE_NEWS).isActive = true
        
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
     
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        
    }
}
