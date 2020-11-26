//
//  UserDefaultManager.swift
//  Bookquipo
//
//  Created by Elmy on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import Foundation

class UserDefaultManager : UserDefaults {
   static let shared = UserDefaultManager()
    
    fileprivate let bookmarkDatas = "bookmarkDatas"
    
    fileprivate var preference: UserDefaults = {
        return UserDefaults.standard
    }()
    
    var bookmarkData : [Books]? {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                preference.set(encoded, forKey: bookmarkDatas)
            }
        }
        get {
            if let blogData = UserDefaults.standard.data(forKey: bookmarkDatas),
                let blog = try? JSONDecoder().decode([Books].self, from: blogData) {
                return blog
            }
            return nil
        }
    }
    
    // to save to userdefaults
    func save() {
        preference.synchronize()
    }
    
    // to remove from userdefaults
    func removeUserToken(){
        preference.removeObject(forKey: bookmarkDatas)
    }
    
}
