//
//  LRChannel.swift
//  EvoRadio
//
//  Created by Jarvis on 16/4/18.
//  Copyright © 2016年 JQTech. All rights reserved.
//

import Foundation
import ObjectMapper

public class LRChannel: Mappable {
    var channelId: String?
    var channelName: String?
    var channelDesc: String?
    var radioId: String?
    var radioName: String?
    var picURL: String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        channelId    <- map["channel_id"]
        channelName    <- map["channel_name"]
        channelDesc    <- map["channel_desc"]
        radioId    <- map["radio_id"]
        radioName    <- map["radio_name"]
        picURL    <- map["pic_url"]
    }
    
}
