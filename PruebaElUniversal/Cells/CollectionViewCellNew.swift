//
//  CollectionViewCellNew.swift
//  PruebaElUniversal
//
//  Created by Ago Consultores on 14/08/20.
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCellNew: UICollectionViewCell {
    
    let vHeaderContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let vTitleContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let vSubtitleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    let vImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let lTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 3
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lTitleUniversal: UILabel = {
        let label = UILabel()
        label.text = Strings.titleName
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lFecha: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 3
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ivUrlImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let ivIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_universal")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let sizes = Sizes.instance()
            self.contentView.backgroundColor = UIColor.white
            
            self.contentView.addSubview(vHeaderContainer)
            vHeaderContainer.addSubview(ivIcon)
            vHeaderContainer.addSubview(lTitleUniversal)
            vHeaderContainer.addSubview(lFecha)
            
            self.contentView.addSubview(vTitleContainer)
            vTitleContainer.addSubview(lTitle)
            self.contentView.addSubview(ivUrlImage)
            self.contentView.addSubview(vSubtitleContainer)
            vSubtitleContainer.addSubview(lSubtitle)
            
            self.contentView.layer.cornerRadius = 10
            self.contentView.layer.borderWidth = 1
            
            vHeaderContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
            vHeaderContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
            vHeaderContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 5).isActive = true
            vHeaderContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 10 / 100).isActive = true
            
            ivIcon.topAnchor.constraint(equalTo: vHeaderContainer.topAnchor).isActive = true
            ivIcon.leftAnchor.constraint(equalTo: vHeaderContainer.leftAnchor).isActive = true
            ivIcon.widthAnchor.constraint(equalTo: vHeaderContainer.heightAnchor).isActive = true
            ivIcon.heightAnchor.constraint(equalTo: vHeaderContainer.heightAnchor).isActive = true
            
            lTitleUniversal.topAnchor.constraint(equalTo: vHeaderContainer.topAnchor).isActive = true
            lTitleUniversal.leftAnchor.constraint(equalTo: ivIcon.rightAnchor, constant: 5).isActive = true
            lTitleUniversal.rightAnchor.constraint(equalTo: vHeaderContainer.rightAnchor).isActive = true
            lTitleUniversal.heightAnchor.constraint(equalTo: vHeaderContainer.heightAnchor, multiplier: 1/2).isActive = true
            
            lFecha.topAnchor.constraint(equalTo: lTitleUniversal.bottomAnchor).isActive = true
            lFecha.leftAnchor.constraint(equalTo: lTitleUniversal.leftAnchor).isActive = true
            lFecha.rightAnchor.constraint(equalTo: lTitleUniversal.rightAnchor).isActive = true
            lFecha.heightAnchor.constraint(equalTo: lTitleUniversal.heightAnchor).isActive = true
            
            vTitleContainer.topAnchor.constraint(equalTo: vHeaderContainer.bottomAnchor).isActive = true
            vTitleContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
            vTitleContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
            vTitleContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 15 / 100).isActive = true
            
            lTitle.centerYAnchor.constraint(equalTo: vTitleContainer.centerYAnchor).isActive = true
            lTitle.centerXAnchor.constraint(equalTo: vTitleContainer.centerXAnchor).isActive = true
            lTitle.widthAnchor.constraint(equalTo: vTitleContainer.widthAnchor, constant: -2 * sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
            lTitle.heightAnchor.constraint(equalTo: vTitleContainer.heightAnchor, constant: -2 * sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
            
            ivUrlImage.topAnchor.constraint(equalTo: vTitleContainer.bottomAnchor).isActive = true
            ivUrlImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
            ivUrlImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
            ivUrlImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 60 / 100).isActive = true
        
            vSubtitleContainer.topAnchor.constraint(equalTo: ivUrlImage.bottomAnchor).isActive = true
            vSubtitleContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
            vSubtitleContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
            vSubtitleContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 15 / 100).isActive = true
            
            lSubtitle.centerYAnchor.constraint(equalTo: vSubtitleContainer.centerYAnchor).isActive = true
            lSubtitle.centerXAnchor.constraint(equalTo: vSubtitleContainer.centerXAnchor).isActive = true
            lSubtitle.widthAnchor.constraint(equalTo: vSubtitleContainer.widthAnchor, constant: -2 * sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
            lSubtitle.heightAnchor.constraint(equalTo: vSubtitleContainer.heightAnchor, constant: -2 * sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
    }
    /*override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let sizes = Sizes.instance()
        self.contentView.backgroundColor = UIColor.white
        
        self.contentView.addSubview(vHeaderContainer)
        vHeaderContainer.addSubview(ivIcon)
        vHeaderContainer.addSubview(lTitleUniversal)
        vHeaderContainer.addSubview(lFecha)
        
        self.contentView.addSubview(vTitleContainer)
        vTitleContainer.addSubview(lTitle)
        self.contentView.addSubview(ivUrlImage)
        self.contentView.addSubview(vSubtitleContainer)
        vSubtitleContainer.addSubview(lSubtitle)
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
        
        vHeaderContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        vHeaderContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
        vHeaderContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 5).isActive = true
        vHeaderContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 10 / 100).isActive = true
        
        ivIcon.topAnchor.constraint(equalTo: vHeaderContainer.topAnchor).isActive = true
        ivIcon.leftAnchor.constraint(equalTo: vHeaderContainer.leftAnchor).isActive = true
        ivIcon.widthAnchor.constraint(equalTo: vHeaderContainer.heightAnchor).isActive = true
        ivIcon.heightAnchor.constraint(equalTo: vHeaderContainer.heightAnchor).isActive = true
        
        lTitleUniversal.topAnchor.constraint(equalTo: vHeaderContainer.topAnchor).isActive = true
        lTitleUniversal.leftAnchor.constraint(equalTo: ivIcon.rightAnchor, constant: 5).isActive = true
        lTitleUniversal.rightAnchor.constraint(equalTo: vHeaderContainer.rightAnchor).isActive = true
        lTitleUniversal.heightAnchor.constraint(equalTo: vHeaderContainer.heightAnchor, multiplier: 1/2).isActive = true
        
        lFecha.topAnchor.constraint(equalTo: lTitleUniversal.bottomAnchor).isActive = true
        lFecha.leftAnchor.constraint(equalTo: lTitleUniversal.leftAnchor).isActive = true
        lFecha.rightAnchor.constraint(equalTo: lTitleUniversal.rightAnchor).isActive = true
        lFecha.heightAnchor.constraint(equalTo: lTitleUniversal.heightAnchor).isActive = true
        
        vTitleContainer.topAnchor.constraint(equalTo: vHeaderContainer.bottomAnchor).isActive = true
        vTitleContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        vTitleContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        vTitleContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 15 / 100).isActive = true
        
        lTitle.centerYAnchor.constraint(equalTo: vTitleContainer.centerYAnchor).isActive = true
        lTitle.centerXAnchor.constraint(equalTo: vTitleContainer.centerXAnchor).isActive = true
        lTitle.widthAnchor.constraint(equalTo: vTitleContainer.widthAnchor, constant: -2 * sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
        lTitle.heightAnchor.constraint(equalTo: vTitleContainer.heightAnchor, constant: -2 * sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
        
        ivUrlImage.topAnchor.constraint(equalTo: vTitleContainer.bottomAnchor).isActive = true
        ivUrlImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        ivUrlImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        ivUrlImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 60 / 100).isActive = true
    
        vSubtitleContainer.topAnchor.constraint(equalTo: ivUrlImage.bottomAnchor).isActive = true
        vSubtitleContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        vSubtitleContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        vSubtitleContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 15 / 100).isActive = true
        
        lSubtitle.centerYAnchor.constraint(equalTo: vSubtitleContainer.centerYAnchor).isActive = true
        lSubtitle.centerXAnchor.constraint(equalTo: vSubtitleContainer.centerXAnchor).isActive = true
        lSubtitle.widthAnchor.constraint(equalTo: vSubtitleContainer.widthAnchor, constant: -2 * sizes.MARGIN_WIDTH_ITEM_NEWS).isActive = true
        lSubtitle.heightAnchor.constraint(equalTo: vSubtitleContainer.heightAnchor, constant: -2 * sizes.MARGIN_HEIGHT_ITEM_NEWS).isActive = true
    }*/
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
    }
}
