//
// 
// FileName: OrderListViewController.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 09-11-2024 at 1:14 AM
// Website: https://mdabirhossain.com/
//


import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCell()
        
        ProgressHUD.animate("Loading...")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
                case .success(let orders):
                    self?.orders = orders
                    self?.tableView.reloadData()
                    print(orders)
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

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instanciate()
        controller.dish = orders[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
