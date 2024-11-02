//
// 
// FileName: OnboardingCollectionViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 02-11-2024 at 7:06 AM
// Website: https://mdabirhossain.com/
//


import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(slide: OnboardingSlide) {
        slideImageView.image = slide.image
        titleLbl.text = slide.title
        descriptionLbl.text = slide.description
    }
}
