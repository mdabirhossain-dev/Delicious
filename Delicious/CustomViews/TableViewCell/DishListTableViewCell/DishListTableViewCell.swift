//
// 
// FileName: DishListTableViewCell.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 08-11-2024 at 6:30 PM
// Website: https://mdabirhossain.com/
//


import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        titleLabel.text = order.dish?.name
        descriptionLabel.text = order.name
    }
    
}
