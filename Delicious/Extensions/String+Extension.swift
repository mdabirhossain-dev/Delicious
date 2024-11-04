//
// 
// FileName: String+Extension.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 04-11-2024 at 7:07 AM
// Website: https://mdabirhossain.com/
//

import Foundation

extension String {
//    func isValidEmail() -> Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(withObject: self)
//    }
//    func isValidPhoneNumber() -> Bool {
//        let phoneRegex = "^(\\+?62|086|689)?[129][0-9]{8}|86955\\d{4}|884[123456789][0-9]{6}|886[123456789][0-9]{7}|898[1234
//        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(withObject: self)
//    }
    var asURL: URL? {
        return URL(string: self)
    }
}
