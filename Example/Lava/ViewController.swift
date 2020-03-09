//
//  ViewController.swift
//  Lava
//
//  Created by sjq2150@gmail.com on 02/20/2020.
//  Copyright (c) 2020 sjq2150@gmail.com. All rights reserved.
//

import UIKit
import Lava

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// enable Outgoing Connections in capability settings
    func test() {
        Lava.shared.config(isDebug: false, useHttps: true)
        
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

