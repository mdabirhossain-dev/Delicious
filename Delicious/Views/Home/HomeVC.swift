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
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    
    let categories: [DishCategory] = [
        DishCategory(id: "id", title: "African Dish 0", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 1", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 2", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 3", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 4", imageName: "https://picsum.photos/100/200"),
        DishCategory(id: "id", title: "African Dish 5", imageName: "https://picsum.photos/100/200"),
    ]
    let populars: [Dish] = [
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 51.2343),
        .init(id: "id2", name: "Sausages", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 52.3343),
        .init(id: "id3", name: "Pasta", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 53.4343),
        .init(id: "id4", name: "Burger", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 54.5343),
        .init(id: "id4", name: "Luchi", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 55.6343)
    ]
    
    let specials: [Dish] = [
        .init(id: "id3", name: "Fried Plantine", image: "https://picsum.photos/100/200", description: "This is the best one.", calories: 53.4343),
        .init(id: "id4", name: "Beans and Garri", image: "https://picsum.photos/100/200", description: "This is the best food I have ever tested.", calories: 54.5343),
        .init(id: "id4", name: "Luchi", image: "https://picsum.photos/100/200", description: "Taste is so good.", calories: 55.6343)
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
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil),  forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        chefsSpecialsCollectionView.register(UINib(nibName: ChefsSpecialsCollectionViewCell.identifier, bundle: nil),  forCellWithReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier)
    }
}

extension HomeVC: UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case categoryCollectionView:
                return categories.count
            case popularCollectionView:
                return populars.count
            case chefsSpecialsCollectionView:
                return specials.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case categoryCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
                cell.setup(category: categories[indexPath.row])
                
                return cell
            case popularCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
                cell.setup(dish: populars[indexPath.row])
                
                return cell
            case chefsSpecialsCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier, for: indexPath) as! ChefsSpecialsCollectionViewCell
                cell.setup(dish: specials[indexPath.row])
                
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}
