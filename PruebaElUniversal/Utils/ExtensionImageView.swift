//
//  ExtensionImageView.swift
//  PruebaElUniversal
//
//  Created by Ago Consultores on 09/07/21.
//  Copyright © 2021 Silviano. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImageFromUrl(from: URL) {

        kf.indicatorType = .activity
        kf.setImage(
            with: from,
            placeholder: UIImage(named: "AppIcon"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                debugPrint("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                debugPrint("Job failed: \(error.localizedDescription)")
                self.image = UIImage(named: "AppIcon")
                self.contentMode = .scaleAspectFit
            }
        }
    }
}
