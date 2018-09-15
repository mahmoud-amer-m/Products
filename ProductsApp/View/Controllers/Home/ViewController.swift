//
//  ViewController.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView: UITableView = UITableView()
    var deliveries: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Things to Deliver"
        
        setupView()
        getDeliveries()
    }
    
    func getDeliveries() {
        ServicesManager.getDeliveries(offset: 0, limit: 7, completion: { [weak self] (products) in
            guard let `self` = self else { return }
            if let deliveries = products, deliveries.count > 0 {
                self.deliveries = deliveries
                self.tableView.reloadData()
            } else {
                self.showErrorAlert()
            }
        }) { (error) in
            self.showErrorAlert(message: error)
        }
    }
    
    func showErrorAlert(message: String = "Something went wrong") {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { [weak self] action in
            self?.getDeliveries()
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructCellWithProduct(tableView: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deliveryVC: DeliveryViewController = DeliveryViewController()
        deliveryVC.delivery = deliveries[indexPath.row]
        deliveryVC.setupView()
        navigationController?.pushViewController(deliveryVC, animated: true)
    }
    
    func constructCellWithProduct(tableView: UITableView, at  indexPath: IndexPath) -> DeliveryCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryCell
        cell.deliveryImageView.image = nil
        
        let delivery = deliveries[indexPath.row]
        cell.descriptionLabel.text = "\(delivery.description ?? "NO DESCRIPTION")"
        cell.deliveryImageView.sd_setImage(with: URL(string: delivery.imageUrl ?? ""), placeholderImage: UIImage(named: "deliveryIcon"), options: .refreshCached, completed: nil)
        return cell
    }
}

