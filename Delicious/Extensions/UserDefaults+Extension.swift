//
// 
// FileName: UserDefaults+Extension.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 12-11-2024 at 7:35 AM
// Website: https://mdabirhossain.com/
//


import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
