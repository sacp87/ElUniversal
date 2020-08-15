//
//  Utils.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    static func saveOnUserDefaults (object: Any?, forKey: String) ->Bool {
        let preferences = UserDefaults.standard
        preferences.set(object, forKey: forKey)
        //  Save to disk
        let didSave = preferences.synchronize()
        return didSave
    }
    static func objectToJsonString<T: Codable> (object: T) -> String{
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(object)
            return String(data: data, encoding: .utf8)!
        }catch {
            return "";
        }
    }
    /*static func getUrlConParametros(servicio: Servicio, parametros: Array<String>) -> String{
        var url = getUrlBase() + servicio.getNombre()
        if !parametros.isEmpty{
            url += "?" + String(format: servicio.getParametros(), arguments: parametros) + "&version=\(Constantes.VERSION)"
        }
        return url
    }*/
    
    static func alert( viewController : UIViewController, title: String, message: String, nameOkButton: String, nameCancelButton: String?, onClickButtonsAlerts: OnClickButtonsAlerts?, idAlert:Int){
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let okAction = UIAlertAction(title: nameOkButton, style:.default, handler: { (UIAlertAction) in
            if onClickButtonsAlerts != nil {
                if idAlert != 0 {
                    onClickButtonsAlerts!.onOkClick(tagName: idAlert)
                }
            }
        })
        
        /*let image = UIImage(named: "ic_ra")
        var action = UIAlertAction(title: "title", style: .default, handler: nil)
        action.setValue(image, forKey: "image")
        alerta.addAction(action)*/
        alert.addAction(okAction)
        if nameCancelButton != nil{
            if !nameCancelButton!.elementsEqual(""){
                
                let cancelAction = UIAlertAction(title: nameCancelButton, style:.destructive, handler: { (UIAlertAction) in
                    if onClickButtonsAlerts != nil {
                        if idAlert != 0 {
                            onClickButtonsAlerts!.onCancelClick(tagName: idAlert)
                        }
                    }
                })
                alert.addAction(cancelAction)
            }
        }
        viewController.present(alert, animated: true, completion: nil)
    }
    static func orientation(orientation: UIDeviceOrientation) -> String{
        
        switch (orientation) {
            case .portrait:
                return "portrait"
            case .landscapeRight:
                return "landscapeRight"
            case .landscapeLeft:
                return "landscapeLeft"
            case .portraitUpsideDown:
                return "portraitUpsideDown"
            default:
                return "portrait"
            
          }
    }
    static func actionSheet( viewController : UIViewController, title: String, message: String, nameOkButton: String, nameCancelButton: String?, onClickButtonsAlerts: OnClickButtonsAlerts?, idAlert:Int){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ?  .actionSheet : .alert)
        let okAction = UIAlertAction(title: nameOkButton, style:.default, handler: { (UIAlertAction) in
            if onClickButtonsAlerts != nil {
                if idAlert != 0 {
                    onClickButtonsAlerts!.onOkClick(tagName: idAlert)
                }
            }
        })
        
        /*let image = UIImage(named: "ic_ra")
        var action = UIAlertAction(title: "title", style: .default, handler: nil)
        action.setValue(image, forKey: "image")
        alerta.addAction(action)*/
        alert.addAction(okAction)
        if nameCancelButton != nil{
            if !nameCancelButton!.elementsEqual(""){
                
                let cancelAction = UIAlertAction(title: nameCancelButton, style:.destructive, handler: { (UIAlertAction) in
                    if onClickButtonsAlerts != nil {
                        if idAlert != 0 {
                            onClickButtonsAlerts!.onCancelClick(tagName: idAlert)
                        }
                    }
                })
                alert.addAction(cancelAction)
            }
        }
        viewController.present(alert, animated: true, completion: nil)
    }
    static func _print(_ items: Any..., separator: String = " ", terminator: String = "\n"){
        if(Constants.ES_MODO_DESARROLLO){
            print(items,separator,terminator)
        }
    }
    static func addIconToUITextFieldAtLeft(uITextField: UITextField, imageStringResource: String) -> UIImageView{
        //Define the imageView
        let space:CGFloat = 5
        let imageView = UIImageView()
        let imageEmail = UIImage(named: imageStringResource)
        imageView.image = imageEmail
        
        // set frame on image before adding it to the uitextfield
        
        let iconWidth = uITextField.frame.height
        let iconHeight = uITextField.frame.height
        
        imageView.frame = CGRect(x: space, y: space, width: iconWidth - space * 2, height: iconHeight - space * 2)
        uITextField.leftViewMode = UITextField.ViewMode.always
        uITextField.addSubview(imageView)
        //set Padding
        let paddingView = UIView(frame: CGRect(x: space, y: space, width: uITextField.frame.height, height: uITextField.frame.height))
        uITextField.leftView = paddingView
        return imageView
    }
    
    static func autoResizeFont(uiElementText: UIView, isBold: Bool){
        autoResizeFont(uiElementText: uiElementText, size: uiElementText.frame.height * (uiElementText is UIButton ? (8 / 20) : (1 / 2)), isBold: isBold)
    }
    
    static func autoResizeFont(uiElementText: UIView, size: CGFloat, isBold: Bool){

        var customFont = isBold ? UIFont.boldSystemFont(ofSize: size) : UIFont(descriptor: UIFontDescriptor(name: "System", size: size), size: size)
        
        if uiElementText is UITextField {
            let uITextField = uiElementText as! UITextField
            uITextField.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
            uITextField.adjustsFontForContentSizeCategory = true
        } else {
            var uiElementTextTemp = uiElementText
            if uiElementTextTemp is UIButton {
                let uIButton = uiElementTextTemp as! UIButton
                
                customFont = UIFont.boldSystemFont(ofSize: size)
                
                uiElementTextTemp = uIButton.titleLabel!
            }
            if uiElementTextTemp is UILabel {
                let uILabel = uiElementTextTemp as! UILabel
                uILabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
                uILabel.adjustsFontForContentSizeCategory = true
            }
        }
        
    }
    struct AppUtility {

        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {

            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }

        /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

            self.lockOrientation(orientation)

            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }

    }
}
extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
