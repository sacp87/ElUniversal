//
//  Sizes.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class Sizes {
    private static var orietation: UIDeviceOrientation = .portrait
    private static var sizes = Sizes()
    private let uIView: UIView
    
    let SIZE_ITEM_NEWS: CGFloat
    let NUMBER_SECTIONS: Int
    let MARGIN_WIDTH_ITEM_NEWS: CGFloat
    let MARGIN_HEIGHT_ITEM_NEWS: CGFloat
    
    let SIZE_HEIGHT_IMAGE_NEWS: CGFloat
   
    private init(){
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        
        uIView = AppDelegate.getViewControllerMain().view!
        var width = uIView.frame.width
        var height = uIView.frame.height
        if uIView.frame.width > uIView.frame.height && Sizes.orietation == .portrait{
            height = uIView.frame.width
            width = uIView.frame.height
        }
        Utils._print("pantalla width: \(width)");
        SIZE_ITEM_NEWS = isIpad ? (Sizes.orietation == .portrait ? (height * 3 / 10) : (width * 3 / 10)) : (height * 5 / 10)
        NUMBER_SECTIONS = isIpad ? (Sizes.orietation == .portrait ? 2 : 3 ): 1
        MARGIN_WIDTH_ITEM_NEWS = 10
        MARGIN_HEIGHT_ITEM_NEWS = 5
        
        SIZE_HEIGHT_IMAGE_NEWS = SIZE_ITEM_NEWS * 2 / 3
        
    }
    static func instance() -> Sizes {
        
        var currentOrientation: UIDeviceOrientation = UIDevice.current.orientation
        currentOrientation = ( currentOrientation == .portraitUpsideDown || currentOrientation == .portrait ) ? .portrait : ( currentOrientation == .portraitUpsideDown || currentOrientation == .portrait ) ? .landscapeRight : .portrait
        if self.orietation != currentOrientation {
            self.orietation = currentOrientation
            Sizes.sizes = Sizes()
        }
        return Sizes.sizes
    }
}
