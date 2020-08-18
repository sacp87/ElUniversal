//
//  UIViewControllerNewsDescription.swift
//  PruebaElUniversal
//
//  Created by Ago Consultores on 14/08/20.
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class UIViewControllerNewsDescription: UIViewControllerGeneric{
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let vHeaderContainer:UIView = {
        let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.sizeToFit()
       return view
   }()
   let vImageContainer: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.clipsToBounds = true
       return view
    
   }()
    let lTitle: UILabel = {
    let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 16)
       label.numberOfLines = 3
       label.textColor = UIColor.black
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   let lTitleUniversal: UILabel = {
       let label = UILabel()
       label.text = Strings.titleName
       label.font = UIFont.boldSystemFont(ofSize: 18)
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 3
       label.textColor = UIColor.black
       return label
   }()
   let lFecha: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 14)
       label.numberOfLines = 3
       label.textColor = UIColor.gray
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   let lSubtitle: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 14)
       label.numberOfLines = 50
       label.textColor = UIColor.black
       label.numberOfLines = 0
       label.sizeToFit()
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   let ivUrlImage: UIImageView = {
       let image = UIImageView()
       image.backgroundColor = UIColor.black
       image.translatesAutoresizingMaskIntoConstraints = false
       image.clipsToBounds = true
       return image
   }()
    let lLink: UILabel = {
        let lLink = UILabel()
        lLink.font = UIFont.systemFont(ofSize: 14)
        lLink.textColor = UIColor.blueUniversal
        lLink.numberOfLines = 0
        lLink.sizeToFit()
        lLink.translatesAutoresizingMaskIntoConstraints = false
        return lLink
    }()
    let ivIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
   }()
    private var presenterNews: PresenterNews?
    private var welcomeNews: PojoNews.Response.WelcomeNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if welcomeNews == nil {
            onUINavigationBar?.pop()
        }else{

            onUINavigationBar?.setTitleBar(title: "Descripción")
            onUINavigationBar?.backButton(imageName: "ic_back")
            initUI()
            initData()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
        ivIcon.image = UIImage(named: "ic_universal")
        ivIcon.contentMode = .scaleAspectFit

    }
    func setWelcomeNews(welcomeNews: PojoNews.Response.WelcomeNews){
        self.welcomeNews = welcomeNews
    }
}
extension UIViewControllerNewsDescription{
    private func initUI() {
        setupScrollView()
        setupViews()
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        
        view.backgroundColor = UIColor.white
        self.contentView.addSubview(vHeaderContainer)
        vHeaderContainer.addSubview(ivIcon)
        vHeaderContainer.addSubview(lTitleUniversal)
        vHeaderContainer.addSubview(lFecha)
        
        self.contentView.addSubview(lTitle)
        self.contentView.addSubview(ivUrlImage)
        self.contentView.addSubview(lLink)
        self.contentView.addSubview(lSubtitle)
        
        vHeaderContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        vHeaderContainer.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        vHeaderContainer.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 95 / 100).isActive = true
        vHeaderContainer.heightAnchor.constraint(equalToConstant: view.frame.height * 10 / 100).isActive = true
        
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
        
        lTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lTitle.topAnchor.constraint(equalTo: vHeaderContainer.bottomAnchor, constant: 10).isActive = true
        lTitle.widthAnchor.constraint(equalTo: vHeaderContainer.widthAnchor).isActive = true
        
        ivUrlImage.topAnchor.constraint(equalTo: lTitle.bottomAnchor, constant: 10).isActive = true
        ivUrlImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        ivUrlImage.widthAnchor.constraint(equalTo: vHeaderContainer.widthAnchor).isActive = true
        ivUrlImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40 / 100).isActive = true
        
        lLink.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lLink.topAnchor.constraint(equalTo: ivUrlImage.bottomAnchor, constant: 10).isActive = true
        lLink.widthAnchor.constraint(equalTo: vHeaderContainer.widthAnchor).isActive = true
    
        lSubtitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lSubtitle.topAnchor.constraint(equalTo: lLink.bottomAnchor).isActive = true
        lSubtitle.widthAnchor.constraint(equalTo: vHeaderContainer.widthAnchor).isActive = true
        lSubtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true


        let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
        lLink.isUserInteractionEnabled = true
        lLink.addGestureRecognizer(tap)
    }
    @objc func openLink(sender:UITapGestureRecognizer) {
        if let url = URL(string: lLink.text!) {
            UIApplication.shared.open(url)
        }
    }
}

extension UIViewControllerNewsDescription{
    private func initData(){
        lTitle.text = welcomeNews?.title
        lSubtitle.text = welcomeNews!.body!.replacingOccurrences(of: "\n\n", with: "\n")
        lTitleUniversal.text = Strings.titleName
        lFecha.text = welcomeNews!.pubdate! + " " + welcomeNews!.pubtime!
        lLink.text = welcomeNews?.link
        ivUrlImage.pin_updateWithProgress = true
        
        if  welcomeNews!.imageSmallSize != "" {
            ivUrlImage.pin_setImage(from: URL(string: welcomeNews!.imageSmallSize!)!)
            
        }else {
            ivUrlImage.image = UIImage(named: "ic_universal")
        }
        
        onUINavigationBar?.shareButton(url: lLink.text!)
    }
}
