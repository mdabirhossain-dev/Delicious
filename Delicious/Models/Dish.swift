//
// 
// FileName: Dish.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 05-11-2024 at 12:51 AM
// Website: https://mdabirhossain.com/
//


import Foundation


struct Dish: Decodable {
    let id, name, image, description: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
