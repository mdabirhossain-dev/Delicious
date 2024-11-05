//
// 
// FileName: CategoryCollectionViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 03-11-2024 at 6:14 AM
// Website: https://mdabirhossain.com/
//


import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(category: DishCategory) {
        imageView.kf.setImage(with: category.imageName?.asURL)
        titleLabel.text = category.title
    }
}
