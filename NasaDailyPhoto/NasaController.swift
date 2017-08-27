//
//  NasaController.swift
//  NasaDailyPhoto
//
//  Created by MEI KU on 2017/8/28.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class NasaController {
    
    static let shared = NasaController()
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    var nasaArray = [Nasa]()
    
    func fetchSongs(completion: @escaping ([Nasa]?) -> Void) {
        if let urlStr = "https://api.nasa.gov/planetary/apod?api_key=KbC3LNS8QLTk1KaOjWBDT6xvb3s2R8i3a8ZPYSEL&start_date=2017-08-01&end_date=2017-08-25".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let resultArray = (try? JSONSerialization.jsonObject(with: data,options: [])) as? [[String: Any]] {
                    print(resultArray)
                    for nasaDic in resultArray {
                        if let nasa = Nasa(json: nasaDic as! [String : String]) {
                            self.nasaArray.append(nasa)
                        }
                    }
                    completion(self.nasaArray)
                }
            }
            task.resume()
        }
    }
}

