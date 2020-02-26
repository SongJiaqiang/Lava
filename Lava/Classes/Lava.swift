//
//  Lava.swift
//  EvoRadioMac
//
//  Created by Jarvis on 2020/2/8.
//  Copyright © 2020 JQTech. All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper

public typealias ErrorBlock = (Error?) -> Void

let proxy = "http://"
let securityProxy = "https://"
let domain = "www.lavaradio.com/"
let apiAllRadios = "api/radio.listAllChannels.json"
let apiNowChannels = "api/radio.listAllNowChannels.json"
let apiGroundPrograms = "api/radio.listGroundPrograms.json"
let apiPrograms = "api/radio.listChannelPrograms.json"
let apiSongs = "api/play.sharePlayProgram.json"

public class Lava {
    public static let shared = Lava()
    
    var isDebug: Bool! = false
    var useHttps: Bool! = false
    
    public func config(isDebug: Bool = false, useHttps: Bool = false) {
        self.isDebug = isDebug
        self.useHttps = useHttps
    }
    
    /// 获取所有Radio以及其下的所有频道
    /// - Parameter onSuccess: 成功回调
    /// - Parameter onFailed: 失败回调，可选
    public func fetchAllRadios(_ onSuccess: @escaping ([LRRadio]) -> Void, onFailed: ErrorBlock? = nil) {
        let url = (useHttps ? securityProxy : proxy) + domain + apiAllRadios
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let responseValue = response.value as? [String : Any] {
                    if let jsonArray = responseValue["data"] as? [[String : Any]] {
                        let items = Mapper<LRRadio>().mapArray(JSONArray: jsonArray)
                        onSuccess(items)
                    }
                }
                
            }else {
                print("Request all radios failed")
                if let failed = onFailed {
                    failed(response.result.error)
                }
            }
        }
        
    }
    
    /// 获取所有“时刻”频道
    /// - Parameter onSuccess: 成功回调
    /// - Parameter onFailed: 失败回调，可选
    public func fetchNowChannels(_ onSuccess: @escaping ([LRNowChannel]) -> Void, onFailed: ErrorBlock?) {
        let url = (useHttps ? securityProxy : proxy) + domain + apiNowChannels
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let responseValue = response.value as? [String : Any] {
                    if let jsonArray = responseValue["data"] as? [[String : Any]] {
                        
                        let items = Mapper<LRNowChannel>().mapArray(JSONArray: jsonArray)
                        onSuccess(items)
                    }
                }
            }else {
                print("Request now chnnels failed")
                if let failed = onFailed {
                    failed(response.result.error)
                }
            }
            
        }
    }
    
    /// 获取精品节目单，分页
    /// - Parameter page: 分页（起始下标，每页数量）
    /// - Parameter onSuccess: 成功回调
    /// - Parameter onFailed: 失败回调，可选
    public func fetchGroundPrograms(page: LRPage, onSuccess: @escaping ([LRProgram]) -> Void, onFailed: ErrorBlock?) {
        let _pn = (page.index + page.size - 1) / page.size
        let params = "?_pn=\(_pn)&_sz=\(page.size)"
        let url = (useHttps ? securityProxy : proxy) + domain + apiGroundPrograms + params
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let responseValue = response.value as? [String : Any] {
                    if let data = responseValue["data"] as? [String : Any] {
                        if let jsonArray = data["lists"] as? [[String : Any]] {
                            let items = Mapper<LRProgram>().mapArray(JSONArray: jsonArray)
                            onSuccess(items)
                        }
                    }
                }
            }else {
                print("Request ground programs failed")
                if let failed = onFailed {
                    failed(response.result.error)
                }
            }
        }
    }
    
    /// 根据频道ID获取节目单，分页
    /// - Parameter channelId: 频道id
    /// - Parameter page: 分页（起始下标，每页数量）
    /// - Parameter onSuccess: 成功回调
    /// - Parameter onFailed: 失败回调，可选
    public func fetchPrograms(_ channelId: String, page: LRPage, onSuccess: @escaping ([LRProgram]) -> Void, onFailed: ErrorBlock?) {
        let _pn = (page.index + page.size - 1) / page.size
        let params = "?channel_id=\(channelId)&_pn=\(_pn)&_sz=\(page.size)"
        let url = (useHttps ? securityProxy : proxy) + domain + apiPrograms + params
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let responseValue = response.value as? [String : Any] {
                    if let data = responseValue["data"] as? [String : Any] {
                        if let jsonArray = data["lists"] as? [[String : Any]] {
                            let items = Mapper<LRProgram>().mapArray(JSONArray: jsonArray)
                            
                            onSuccess(items)
                        }
                    }
                }
            }else {
                print("Request programs failed")
                if let failed = onFailed {
                    failed(response.result.error)
                }
            }
        }
    }

    /// 根据节目单ID获取其下的所有音乐
    /// - Parameter programId: 歌单id
    /// - Parameter onSuccess: 成功回调
    /// - Parameter onFailed: 失败回调，可选
    public func fetchSongs(_ programId: String, onSuccess: @escaping ([LRSong]) -> Void, onFailed: ErrorBlock?) {
        let params = "?program_id=\(programId)&isShare=1"
        let url = (useHttps ? securityProxy : proxy) + domain + apiSongs + params
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let responseValue = response.value as? [String : Any] {
                    if let data = responseValue["data"] as? [String : Any] {
                        if let jsonArray = data["songs"] as? [[String : Any]] {
                            let items = Mapper<LRSong>().mapArray(JSONArray: jsonArray)
                            onSuccess(items)
                        }
                    }
                }
            }else {
                print("Request songs failed")
                if let failed = onFailed {
                    failed(response.result.error)
                }
            }
        }
    }
}

public struct LRPage {
    var index: Int
    var size: Int
    
    public init(index: Int) {
        self.index = index
        self.size = 20
    }
}
