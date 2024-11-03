//
// 
// FileName: CategoryCollectionViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 03-11-2024 at 6:14 AM
// Website: https://mdabirhossain.com/
//


import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with category: DishCategory) {
        imageView.image = UIImage(named: category.imageName)
        titleLabel.text = category.title
    }
}
