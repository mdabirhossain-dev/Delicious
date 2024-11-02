//
// 
// FileName: UIView+Extensions.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 02-11-2024 at 6:45 AM
// Website: https://mdabirhossain.com/
//


import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
}
