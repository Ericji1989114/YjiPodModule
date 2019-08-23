//
//  YjiStringEx.swift
//  YjiPodModule
//
//  Created by Eric JI on 2019/08/19.
//  Copyright © 2019 Eric JI. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: Encryption

public enum HashType {
    
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
    
    var length: Int32 {
        switch self {
        case .md5: return CC_MD5_DIGEST_LENGTH
        case .sha1: return CC_SHA1_DIGEST_LENGTH
        case .sha224: return CC_SHA224_DIGEST_LENGTH
        case .sha256: return CC_SHA256_DIGEST_LENGTH
        case .sha384: return CC_SHA384_DIGEST_LENGTH
        case .sha512: return CC_SHA512_DIGEST_LENGTH
        }
    }
    
}

public extension String {
    
    // https://stackoverflow.com/questions/55356220/get-string-md5-in-swift-5
    func hash(by hashType: HashType) -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        let hash = data.withUnsafeBytes { (bytes: UnsafePointer<Data>) -> [UInt8] in
            var hash: [UInt8] = [UInt8](repeating: 0, count: Int(hashType.length))
            switch hashType {
            case .md5: CC_MD5(bytes, CC_LONG(data.count), &hash)
            case .sha1: CC_SHA1(bytes, CC_LONG(data.count), &hash)
            case .sha224: CC_SHA224(bytes, CC_LONG(data.count), &hash)
            case .sha256: CC_SHA256(bytes, CC_LONG(data.count), &hash)
            case .sha384: CC_SHA384(bytes, CC_LONG(data.count), &hash)
            case .sha512: CC_SHA512(bytes, CC_LONG(data.count), &hash)
            }
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
}
