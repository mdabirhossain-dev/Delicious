//
// 
// FileName: CardView.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 04-11-2024 at 7:51 AM
// Website: https://mdabirhossain.com/
//


import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.borderWidth = 2
        layer.shadowRadius = 10
        layer.borderColor = UIColor.systemGray6.cgColor
        
        cornerRadius = 10
    }
}
