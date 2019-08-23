//
//  YjiBundleEx.swift
//  YjiPodModule
//
//  Created by Eric JI on 2019/08/20.
//  Copyright © 2019 Eric JI. All rights reserved.
//

import Foundation

fileprivate let bundleFileName = "YjiPodModuleBundle"

extension Bundle {
    
    // https://the-nerd.be/2015/08/07/load-assets-from-bundle-resources-in-cocoapods/
    static func getFrameworkBundle(for currentClass: AnyClass) -> Bundle {
    
        let podBundle = Bundle(for: currentClass)
        let bundleURL = podBundle.url(forResource: bundleFileName, withExtension: "bundle")
        return Bundle(url: bundleURL!)!

    }
}
