//
//  ViewControllerMain.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerMain: UIViewController{
    var container: UIView?
    var blockClick = false;
    var url: String?
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(true, animated: false)
        add(uIViewController: UIViewControllerNews(), isAnimated: true)
        //navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        Utils.AppUtility.lockOrientation(.portrait)
    }
}
extension ViewControllerMain: OnUINavigationBar{
    func shareButton(url: String) {
        if (navigationController?.viewControllers.count)! > 1 {
            let button = UIButton(type: .custom)
            self.url = url
            button.setImage(UIImage(named: "ic_share"), for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            button.widthAnchor.constraint(equalToConstant: 35).isActive = true
            button.heightAnchor.constraint(equalToConstant: 35).isActive = true
            button.addTarget(self, action: #selector(share(_ :)), for: .touchUpInside)
            
            showNavigationBar()
            let visibleViewController = navigationController?.visibleViewController
            visibleViewController!.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
            
        }
    }

    func add(uIViewController: UIViewController!, isAnimated: Bool!) {
        if uIViewController.isKind(of: UIViewControllerGeneric.self) {
            let uIViewControllerGeneric = uIViewController as! UIViewControllerGeneric
            uIViewControllerGeneric.onUINavigationBar = self
        }
        navigationController?.pushViewController(uIViewController, animated: isAnimated)
    }
    
    func pop() {
        if (navigationController?.viewControllers.count)! > 2 {
            navigationController?.popViewController(animated: true)
        }
    }
    func replaceWith(uIViewController: UIViewController!, isAnimated: Bool!) {
        
        var viewControllers = self.navigationController?.viewControllers
        viewControllers!.remove(at: viewControllers!.count - 1)
        if uIViewController.isKind(of: UIViewControllerGeneric.self) {
            let uIViewControllerGeneric = uIViewController as! UIViewControllerGeneric
            uIViewControllerGeneric.onUINavigationBar = self
        }
        viewControllers!.append(uIViewController)
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    func setTitleBar(title: String){
        
        if (navigationController?.viewControllers.count)! > 1 {
            let visibleViewController = navigationController?.visibleViewController
            showNavigationBar()
            visibleViewController!.navigationItem.setHidesBackButton(true, animated: true)
            visibleViewController!.navigationItem.title = title
        }
    }
    func backButton(imageName: String) {
        
        if (navigationController?.viewControllers.count)! > 1 {
            let button = UIButton(type: .custom)
            
            button.setImage(UIImage(named: imageName), for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            button.widthAnchor.constraint(equalToConstant: 35).isActive = true
            button.heightAnchor.constraint(equalToConstant: 35).isActive = true
            button.addTarget(self, action: #selector(back), for: .touchUpInside)
    
            showNavigationBar()
            let visibleViewController = navigationController?.visibleViewController
            visibleViewController!.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: button)]
            
        }
    }
    
    @objc private func back(){
        if !blockClick {
            pop()
        }
    }
    @objc private func share(_ sender: UIButton){
        if !blockClick {
            blockClick = true;
            let visibleViewController = navigationController?.visibleViewController as! UIViewControllerGeneric
            visibleViewController.showInidicator(uiView: visibleViewController.view)
        
            if let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") {//Enter link to your app here
                let objectsToShare = [ myWebsite] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                //Excluded Activities
                activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                //
                activityVC.popoverPresentationController?.sourceView = sender
                self.present(activityVC, animated: true, completion: { () in
                    visibleViewController.hideInidicator()
                    self.blockClick = false;
                })
            }
            
        }
        
    }
    
    private func showNavigationBar(){
        /*if (navigationController?.navigationBar.isHidden)! {
            UINavigationBar.appearance().tintColor = UIColor.white
            navigationController?.navigationBar.barTintColor = UIColor.blueUniversal
            navigationController?.setNavigationBarHidden(false, animated: true)
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        }*/
        UINavigationBar.appearance().tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.blueUniversal
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
extension ViewControllerMain: OnClickButtonsAlerts {
    func onOkClick(tagName: Int) {
        
    }
    
    func onCancelClick(tagName: Int) {
        
    }
    
}

