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
    
    let TEXT_FIELD_NORMAL_HEIGHT: CGFloat
    let TEXT_FIELD_NORMAL_WIDTH: CGFloat
    
    let LABEL_PAGE_TITLE: CGFloat
    let LABEL_PAGE_MESSAGE: CGFloat
    let LABEL_CELL: CGFloat
    
    let IMAGE_VIEW_WIDTH: CGFloat
    let IMAGE_VIEW_HEIGHT: CGFloat
    
    let PADING_WIDTH_1: CGFloat
    let PADING_HEIGHT_1: CGFloat
    
    let PADING_WIDTH_2: CGFloat
    let PADING_HEIGHT_2: CGFloat
    
    let COLLECTION_WIDTH: CGFloat
    let CELL_COLLECTION_WIDTH: CGFloat
    
    let CONTENT_IMAGES_HEIGHT: CGFloat
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
        
        TEXT_FIELD_NORMAL_WIDTH = isIpad ? Sizes.orietation == .portrait ? width * 5 / 10 : width * 3 / 10: width * 3 / 5
        TEXT_FIELD_NORMAL_HEIGHT = height * 1 / 20
        
        LABEL_PAGE_TITLE = height * 1 / 20
        LABEL_PAGE_MESSAGE = LABEL_PAGE_TITLE * 3 / 5
        LABEL_CELL = LABEL_PAGE_TITLE * 7 / 15
        
        IMAGE_VIEW_WIDTH = width * 1 / 2
        IMAGE_VIEW_HEIGHT = height * 3 / 10
        
        PADING_WIDTH_1 = width * 1 / 10
        PADING_HEIGHT_1 = width * 1 / 25
        
        PADING_WIDTH_2 = width * 1 / 30
        PADING_HEIGHT_2 = width * 1 / 50
        
        COLLECTION_WIDTH = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
        CELL_COLLECTION_WIDTH = COLLECTION_WIDTH
        
        CONTENT_IMAGES_HEIGHT = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
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
