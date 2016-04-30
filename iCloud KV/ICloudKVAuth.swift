//
//  ICloudKVAuth.swift
//  iCloud KV
//
//  Created by Brian Hill on 4/30/16.
//

//
// This strategy comes from StackOverflow user Idoogy:
//
// http://stackoverflow.com/questions/11597100/uniquely-identifying-an-ios-user/34484103#34484103
//
// https://developer.apple.com/library/ios/documentation/General/Conceptual/iCloudDesignGuide/Chapters/iCloudFundametals.html
// 

// Questions:
//
//  * The UUID is unique to this user. It is not however, unique to this app, is it? If another app
//    knew the key (), would it generate the same UUID?
//  * Can the UUID be treated like a password? Or can it be intercepted in transit to iCloud?
//

import Foundation

let KEY = "ICloudKVAuth"

private func _getUUID() -> NSUUID {
    
    let defaultStore = NSUbiquitousKeyValueStore.defaultStore()
    
    let uuidString = defaultStore.stringForKey(KEY)
    
    if let uuidString = uuidString {
        // return an NSUUID using the existing string
        return NSUUID.init(UUIDString: uuidString)!
    } else {
        // make a fresh NSUUID, set it and return it
        let uuid = NSUUID.init()
        defaultStore.setString(uuid.UUIDString, forKey: KEY)
        defaultStore.synchronize()
        return uuid
    }
    
}

func getUUIDString() -> String? {
    return _getUUID().UUIDString
}
