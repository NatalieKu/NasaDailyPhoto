//
//  NasaArray.swift
//  NasaDailyPhoto
//
//  Created by MEI KU on 2017/8/28.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import Foundation

struct Nasa: Codable {
    var title: String
    var explanation: String
    var url: URL
    var copyright: String?
    var date: String
    
    
    init?(json: [String: String]) {
        guard let title = json["title"],
            let description = json["explanation"],
            let urlString = json["url"],
            let photoDate = json["date"],
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.explanation = description
        self.url = url
        self.date = photoDate
        self.copyright = json["copyright"]
        
    }
    
    
    struct NasaResults: Codable {
        var resultCount: Int
        var results: [Nasa]
    }
}

