//
//  UIViewControllerGeneric.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class UIViewControllerGeneric: UIViewController {
    private var container: UIView?
    var onUINavigationBar: OnUINavigationBar?
    let settingStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let myActivityIndicator: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.hidesWhenStopped = true
        act.style = UIActivityIndicatorView.Style.whiteLarge
        act.color = UIColor.lightGray
        act.translatesAutoresizingMaskIntoConstraints = false
        return act
    }()

    override func viewDidLoad() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        keyBoard()
    }
    override func viewWillAppear(_ animated: Bool) {
    
        //Utils.AppUtility.lockOrientation(.portrait)
    }
    internal func keyBoard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc override func dismissKeyboard(){
        view.endEditing(true)
    }
    func showInidicator(uiView: UIView){
        if container == nil {
            showActivityIndicatory(uiView: uiView)
        }
        if container != nil && container!.isHidden{
            container?.isHidden = false
        }
    }
    
    func hideInidicator(){
        
        if container != nil {
            if !container!.isHidden{
                container?.isHidden = true
            }
            container = nil
        }
    }
    private func showActivityIndicatory(uiView: UIView) {
        if container == nil {
            container = UIView()
            container?.frame = uiView.frame
            container?.center = uiView.center
            //container.backgroundColor = UIColor(red: 30/255, green: 82/255, blue: 173/255, alpha: 1)
            container?.backgroundColor = UIColor.grayUniversal
            
            let loadingView:UIView = UIView()
            loadingView.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = uiView.center
            loadingView.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 0.5)
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            
            let indicador:UIActivityIndicatorView = UIActivityIndicatorView()
            indicador.frame = CGRect.init(x:0.0, y:0.0, width:80.0, height:80.0);
            loadingView.addSubview(indicador)
            container?.addSubview(loadingView)
            uiView.addSubview(container!)
            indicador.startAnimating()
        }
    }
    class SpinnerViewController: UIViewController {
        var spinner = UIActivityIndicatorView(style: .whiteLarge)
        
        override func loadView() {
            view = UIView()
            view.backgroundColor = UIColor(white: 0, alpha: 0.7)
            
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.startAnimating()
            view.addSubview(spinner)
            
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
