//
// 
// FileName: DishCategory.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 03-11-2024 at 6:23 AM
// Website: https://mdabirhossain.com/
//


import Foundation

struct DishCategory: Decodable {
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
