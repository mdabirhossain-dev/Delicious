//
// 
// FileName: OrderListViewController.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 09-11-2024 at 1:14 AM
// Website: https://mdabirhossain.com/
//


import UIKit

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1",
              name: "Md Abir Hossain",
              dish: .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 436.2343)
             ),
        .init(id: "id1",
              name: "Jabir",
              dish: .init(id: "id1", name: "Burger", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 33.2343)
             ),
        .init(id: "id1",
              name: "Kobir",
              dish: .init(id: "id1", name: "Dried Rice", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 41.2343)
             ),
        .init(id: "id1",
              name: "Labib",
              dish: .init(id: "id1", name: "Donut", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 121.2343)
             ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCell()
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
