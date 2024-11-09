//
// 
// FileName: Route.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 09-11-2024 at 3:17 PM
// Website: https://mdabirhossain.com/
//


import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
            case .temp: return "/temp"
        }
    }
}
