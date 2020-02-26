//
//  LRProgram.swift
//  EvoRadio
//
//  Created by Jarvis on 16/4/18.
//  Copyright © 2016年 JQTech. All rights reserved.
//

import Foundation
import ObjectMapper

public class LRProgram: Mappable{
    var programId: String?
    var programName: String?
    var programDesc: String?
    var picURL: String?
    var channels: [LRChannel]?
    var songNum: Int64?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        programId    <- map["program_id"]
        programName    <- map["program_name"]
        programDesc    <- map["program_desc"]
        picURL    <- map["pic_url"]
        channels    <- map["channels"]
        songNum    <- map["song_num"]
    }
    
}
