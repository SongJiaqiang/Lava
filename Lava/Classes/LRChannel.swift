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
    public var channelId: String?
    public var channelName: String?
    public var channelDesc: String?
    public var radioId: String?
    public var radioName: String?
    public var picURL: String?

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
