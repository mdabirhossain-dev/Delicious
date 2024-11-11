//
// 
// FileName: DishDetailViewController.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 06-11-2024 at 1:17 AM
// Website: https://mdabirhossain.com/
//


import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var orderButtonOutlet: UIButton!
    
    var dish: Dish?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.topItem?.title = ""
        
        imageView.kf.setImage(with: dish?.image?.asURL)
        titleLabel.text = dish?.name
        caloriesLabel.text = dish?.formattedCalories
        descriptionLabel.text = dish?.description
    }
    
    @IBAction func orderButtonAction(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.error("Please enter your name", image: UIImage(systemName: "xmark"))
            return
        }
        
        ProgressHUD.animate("Placing order...")
        NetworkService.shared.placeOrder(dishID: dish?.id ?? "", dishName: dish?.name ?? "") { [weak self] (result) in
            switch result {
                case .success(let order):
                    ProgressHUD.success("Yor order has been placed 👨🏻‍🍳")
                case .failure(let error):
                    ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
}
