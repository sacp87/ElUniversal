//
//  DelegateNews.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation

protocol DelegateViewNews:class{
    func resultRequestCorrectNews(responseNews: [PojoNews.Response.WelcomeNews])
    func resultRequestWrongNews(message:String)
    func errorRequestNews(message:String)
}
protocol DelegatePresenterNews:class{
    func getIsOnSneding() -> Bool
    func sendRequestNews(start: Int, end: Int)
}
