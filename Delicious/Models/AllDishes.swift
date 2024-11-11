//
// 
// FileName: AllDishes.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 10-11-2024 at 11:02 PM
// Website: https://mdabirhossain.com/
//


import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
