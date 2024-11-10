//
// 
// FileName: ApiResponse.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 10-11-2024 at 6:52 AM
// Website: https://mdabirhossain.com/
//


import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
