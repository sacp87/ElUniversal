//
//  PresenterNews.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation

class PresenterNews: DelegatePresenterNews{
    private var isOnSneding = false
    private let delegateViewNews: DelegateViewNews
    init(delegateViewNews: DelegateViewNews) {
        self.delegateViewNews = delegateViewNews
    }
    func sendRequestNews(start: Int, end: Int) {
        if (isOnSneding){
            isOnSneding = true
            let request = NSMutableURLRequest(url: NSURL(string: Constants.URL.URL_BASE + Constants.URL.END_POINT_NEWS + "\(start)/\(end)")! as URL)
            let session = URLSession.shared
            request.httpMethod = Constants.URL.GET
            request.addValue("text/html;charset=UTF-8", forHTTPHeaderField: "Accept")
            request.addValue("ISO-8859-1", forHTTPHeaderField: "Accept-Charset")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            DispatchQueue.main.async {
                
            }
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in

                DispatchQueue.main.async {
                    do{
                        self.isOnSneding = false
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers),
                           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                            
                            let welcomeNews = try! JSONDecoder().decode([PojoNews.Response.WelcomeNews].self, from: jsonData)
                            self.delegateViewNews.resultRequestCorrectNews(responseNews: welcomeNews)
                        } else {
                            self.delegateViewNews.resultRequestWrongNews(message: Strings.Message.MESSAGE_ERROR_JSON)
                        }
                        
                    }catch{
                        self.delegateViewNews.errorRequestNews(message: error.localizedDescription)
                    }
                }
            })
        
            task.resume()
        }
        
    }
    
}

