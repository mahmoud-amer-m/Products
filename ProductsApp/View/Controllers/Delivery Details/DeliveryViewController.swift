//
//  DeliveryViewController.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import UIKit
import MapKit

class DeliveryViewController: UIViewController {
    let detailsContainerView: UIView = UIView()
    let descriptionLabel: UILabel = UILabel()
    let imageView: UIImageView = UIImageView()
    let mapView: MKMapView = MKMapView()
    var delivery: Product! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
