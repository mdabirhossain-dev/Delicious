//
// 
// FileName: UIViewController+Extensions.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 06-11-2024 at 7:15 PM
// Website: https://mdabirhossain.com/
//


import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instanciate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
