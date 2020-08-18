//
//  UIViewControllerNews.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit
import PINRemoteImage

class UIViewControllerNews: UIViewControllerGeneric{
    //let tableView = UITableView()
    private var collectionView: UICollectionView?
    
    private let refreshControl = UIRefreshControl()
    private var presenterNews: PresenterNews?
    private var welcomeNews: [PojoNews.Response.WelcomeNews] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        showInidicator(uiView: view)
        refeshNews()
        
    }
}

extension UIViewControllerNews{
    
    private func initUI(){
        view.backgroundColor = UIColor.white
        onUINavigationBar?.setTitleBar(title: "Noticias")
    
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (self.view.frame.width - 15) / CGFloat(Sizes.instance().NUMBER_SECTIONS), height: Sizes.instance().SIZE_ITEM_NEWS)

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView!)
        
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView!.backgroundColor = UIColor.white
        collectionView!.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView!.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView!.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView!.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        collectionView!.register(CollectionViewCellNew.self,forCellWithReuseIdentifier: CollectionViewCellNew.self.description())
        collectionView!.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(refeshNews), for: .valueChanged)
    }
    @objc private func refeshNews(){
    
        presenterNews = PresenterNews(delegateViewNews: self)
        if !presenterNews!.getIsOnSneding(){
            welcomeNews = []
            presenterNews?.sendRequestNews(start: 0, end: 10)
        }else{
            self.refreshControl.endRefreshing()
            hideInidicator()
        }
        
    }
     
}
extension UIViewControllerNews: DelegateViewNews {
    func resultRequestCorrectNews(responseNews: [PojoNews.Response.WelcomeNews]) {
        hideInidicator()
        refreshControl.endRefreshing()
        welcomeNews.append(contentsOf: responseNews)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.reloadData()
    }
    
    func resultRequestWrongNews(message: String) {
        hideInidicator()
        refreshControl.endRefreshing()
        Utils.alert(viewController: self, title: Strings.Message.TITLE_ERROR, message: message, nameOkButton: Strings.Button.BUTTON_OK, nameCancelButton: nil, onClickButtonsAlerts: nil, idAlert: 0)
    }
    
    func errorRequestNews(message: String) {
        hideInidicator()
        refreshControl.endRefreshing()
        Utils.alert(viewController: self, title: Strings.Message.TITLE_ERROR, message: message, nameOkButton: Strings.Button.BUTTON_OK, nameCancelButton: nil, onClickButtonsAlerts: nil, idAlert: 0)
    }
    
}
extension UIViewControllerNews: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welcomeNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNew.self.description(), for: indexPath) as! CollectionViewCellNew
        Utils._print("collectionView image: " + welcomeNews[indexPath.row].imageSmallSize!)
        cell.backgroundColor = UIColor.white
        cell.lTitle.text = welcomeNews[indexPath.row].title
        cell.ivUrlImage.pin_updateWithProgress = true
        if  welcomeNews[indexPath.row].imageSmallSize! != "" {
            cell.ivUrlImage.pin_setImage(from: URL(string: welcomeNews[indexPath.row].imageSmallSize!)!)
            
        }else {
            cell.ivUrlImage.image = UIImage(named: "ic_universal")
        }
        cell.ivUrlImage.contentMode = .scaleAspectFit
        cell.lFecha.text = welcomeNews[indexPath.row].pubdate! + " " + welcomeNews[indexPath.row + indexPath.section].pubtime!
        cell.lSubtitle.text = welcomeNews[indexPath.row].body?.replacingOccurrences(of: "\n", with: "")

        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let uIViewControllerNewsDescription = UIViewControllerNewsDescription()
        uIViewControllerNewsDescription.setWelcomeNews(welcomeNews: welcomeNews[indexPath.row])
        onUINavigationBar?.add(uIViewController: uIViewControllerNewsDescription, isAnimated: true)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        // Use this 'canLoadFromBottom' variable only if you want to load from bottom iff content > table size
        let contentSize = scrollView.contentSize.height
        let tableSize = scrollView.frame.size.height - scrollView.contentInset.top - scrollView.contentInset.bottom
        let canLoadFromBottom = contentSize > tableSize

        // Offset
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let difference = maximumOffset - currentOffset

        // Difference threshold as you like. -120.0 means pulling the cell up 120 points
        if canLoadFromBottom, difference <= -120.0 {

            // Save the current bottom inset
            let previousScrollViewBottomInset = scrollView.contentInset.bottom
            // Add 50 points to bottom inset, avoiding it from laying over the refresh control.
            scrollView.contentInset.bottom = previousScrollViewBottomInset

            self.presenterNews = PresenterNews(delegateViewNews: self)
            if !(self.presenterNews!.getIsOnSneding()){
                self.presenterNews?.sendRequestNews(start: self.welcomeNews.count + 1, end: self.welcomeNews.count + 13)
            }
        }
    }
}
