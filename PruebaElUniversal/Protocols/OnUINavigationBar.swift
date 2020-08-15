//
//  OnUINavigationBar.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

protocol OnUINavigationBar: class{
    func add(uIViewController: UIViewController!, isAnimated: Bool!)
    func replaceWith(uIViewController: UIViewController!, isAnimated: Bool!)
    func pop()
    func setTitleBar(title: String)
    func backButton(imageName: String)
    func shareButton(url: String)
}
