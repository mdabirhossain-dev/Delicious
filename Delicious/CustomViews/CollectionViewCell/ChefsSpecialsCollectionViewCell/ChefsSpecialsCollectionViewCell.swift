//
// 
// FileName: ChefsSpecialsCollectionViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 05-11-2024 at 6:17 AM
// Website: https://mdabirhossain.com/
//


import UIKit
import Kingfisher

class ChefsSpecialsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ChefsSpecialsCollectionViewCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(dish: Dish) {
        imageView.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
}
