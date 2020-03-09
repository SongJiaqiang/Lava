//
//  LRNowChannel.swift
//  EvoRadio
//
//  Created by Jarvis on 07/08/2017.
//  Copyright © 2017 JQTech. All rights reserved.
//

import Foundation
import ObjectMapper

public class LRNowChannel: Mappable {

    public var dayofweek: String?
    public var timeid: String?
    public var channels: [LRChannel]?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        dayofweek    <- map["dayofweek"]
        timeid    <- map["timeid"]
        channels    <- map["channels"]
    }
    
}
