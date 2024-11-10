//
// 
// FileName: AppError.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 10-11-2024 at 12:53 AM
// Website: https://mdabirhossain.com/
//


import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            case .errorDecoding:
                return "Response could not be decoded..."
            case .unknownError:
                return "No idea about the ERROR..."
            case .invalidURL:
                return "Invalid URL"
            case .serverError(let error):
                return error
        }
    }
}
