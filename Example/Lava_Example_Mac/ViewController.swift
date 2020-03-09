//
//  ViewController.swift
//  Lava_Example_Mac
//
//  Created by Jarvis on 2020/3/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Cocoa
import Lava

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        test()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func test() {
        
        Lava.shared.config(isDebug: false, useHttps: false)
        
        Lava.shared.fetchAllRadios({ (objects) in
            print("fetchAllRadios successed \(objects.count)")
        }) { (e) in
            print("failed: \(String(describing: e))")
        }
        
        Lava.shared.fetchNowChannels({ (objects) in
            print("fetchNowChannels successed \(objects.count)")
        }) { (e) in
            print("fetchGroundPrograms failed: \(String(describing: e))")
        }

        Lava.shared.fetchGroundPrograms(page: LRPage(index: 0), onSuccess: { (objects) in
            print("fetchGroundPrograms successed \(objects.count)")
        }, onFailed: nil)
        
        Lava.shared.fetchPrograms("123", page: LRPage(index: 0), onSuccess: { (objects) in
            print("fetchPrograms successed \(objects.count)")
        }, onFailed: nil)
        
        Lava.shared.fetchSongs("39610", onSuccess: { (objects) in
            print("fetchSongs successed \(objects.count)")
        }, onFailed: nil)
    }

}

