//
//  Models.swift
//  PlatziGameStream
//
//  Created by Jorge Plasencia on 21/10/21.
//

import Foundation

struct Games:Codable {
    var games:[Game]
}

struct Game:Codable{
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var descriptionL:String
    var platformas:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}

struct videoUrl:Codable{
    var mobile:String
    var tablet:String
}
