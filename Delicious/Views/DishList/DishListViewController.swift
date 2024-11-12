//
// 
// FileName: DishListViewController.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 08-11-2024 at 6:57 PM
// Website: https://mdabirhossain.com/
//


import UIKit
import ProgressHUD

class DishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishList: [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = category.name
        registerCell()
        
        ProgressHUD.animate("Loadig...")
        NetworkService.shared.fetchCategoryDishes(categoryID: category.id ?? "") { [weak self] (result) in
            switch result {
                case .success(let dishes):
                    self?.dishList = dishes
                    self?.tableView.reloadData()
                    print(dishes)
                    ProgressHUD.succeed()
                case .failure(let error):
                    ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension DishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instanciate()
        controller.dish = dishList[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
        print("tapped")
    }
}
