//
// 
// FileName: HomeVC.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 03-11-2024 at 12:55 AM
// Website: https://mdabirhossain.com/
//


import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let categories: [DishCategory] = [
        DishCategory(id: "id", title: "African Dish 0", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 1", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 2", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 3", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 4", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 5", imageName: "https://picsum.photos/100/200"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        registerNib()
    }
    
    private func setupView() {
        title = "Delicious"
    }
    
    private func registerNib() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),  forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeVC: UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        categories.count
//    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categories[indexPath.row])
        
        return cell
    }
    
    
}
