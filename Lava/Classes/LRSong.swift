//
//  LRSong.swift
//  EvoRadio
//
//  Created by Jarvis on 16/4/18.
//  Copyright © 2016年 JQTech. All rights reserved.
//

import Foundation
import ObjectMapper

public class LRSong : NSObject, Mappable {

    public var songId: String!
    public var songName: String!
    public var salbumsName: String?
    public var artistsName: String?
    public var duration: String?
    public var filesize: String?
    public var audioURL: String?
    public var picURL: String?
    public var programId: String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        songId    <- map["song_id"]
        songName   <- map["song_name"]
        salbumsName    <- map["salbums_name"]
        artistsName   <- map["artists_name"]
        duration   <- map["duration"]
        filesize   <- map["filesize"]
        audioURL   <- map["audio_url"]
        picURL   <- map["pic_url"]
        programId    <- map["program_id"]
    }

}
