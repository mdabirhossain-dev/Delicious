//
// 
// FileName: PopularCollectionViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 04-11-2024 at 7:13 PM
// Website: https://mdabirhossain.com/
//


import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopularCollectionViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        imageView.kf.setImage(with: dish.image?.asURL)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
