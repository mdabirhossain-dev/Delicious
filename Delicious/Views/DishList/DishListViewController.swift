//
// 
// FileName: DishListViewController.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 08-11-2024 at 6:57 PM
// Website: https://mdabirhossain.com/
//


import UIKit

class DishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    let dishList: [Dish] = [
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 51.2343),
        .init(id: "id2", name: "Sausages", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested--1. This is the best food I have ever tested--2. This is the best food I have ever tested--3. This is the best food I have ever tested--4. This is the best food I have ever tested--5. ", calories: 52.3343),
        .init(id: "id3", name: "Pasta", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 53.4343),
        .init(id: "id4", name: "Burger", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 54.5343),
        .init(id: "id4", name: "Luchi", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 55.6343)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = category.name
        registerCell()
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
