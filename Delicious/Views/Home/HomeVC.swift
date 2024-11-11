//
// 
// FileName: HomeVC.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 03-11-2024 at 12:55 AM
// Website: https://mdabirhossain.com/
//


import UIKit
import ProgressHUD

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        
        ProgressHUD.animate("Loading...")
        ProgressHUD.colorAnimation = .purple
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
                case .success(let allDishes):
                    print("ALL DISHES data fetched: \(allDishes)")
                    self?.categories = allDishes.categories ?? []
                    self?.populars = allDishes.populars ?? []
                    self?.specials = allDishes.specials ?? []
                    
                    self?.categoryCollectionView.reloadData()
                    self?.popularCollectionView.reloadData()
                    self?.chefsSpecialsCollectionView.reloadData()
                    
                    ProgressHUD.succeed()
                case .failure(let error):
                    print("ALL DISHES err: \(error.localizedDescription)")
                    ProgressHUD.failed(error.localizedDescription)
            }
        }
    }
    
    private func setupView() {
        title = "Delicious"
        
        registerNib()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = DishListViewController.instanciate()
            controller.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instanciate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
