//
//  DeliveryViewController+views.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import UIKit

extension DeliveryViewController {
    func drawScreen() {
        self.title = "Delivery Details"
        
        detailsContainerView.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailsContainerView.backgroundColor = .red
        view.addSubview(detailsContainerView)
        view.addSubview(mapView)
        
        //MARK -- MapView
        //Top
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 8))
        //Bottom
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -300))
        //leading
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 8))
        //trailing
        view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -8))
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: delivery.location?.lat ?? 0, longitude: delivery.location?.lng ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        //Top
        view.addConstraint(NSLayoutConstraint(item: detailsContainerView, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1, constant: 8))
        //leading
        view.addConstraint(NSLayoutConstraint(item: detailsContainerView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 8))
        //trailing
        view.addConstraint(NSLayoutConstraint(item: detailsContainerView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -8))
        //Height
        view.addConstraint(NSLayoutConstraint(item: detailsContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70))
        
    
        setupDetails()
    }
    
    func setupDetails() {
        descriptionLabel.text = delivery.description
        imageView.sd_setImage(with: URL(string: delivery.imageUrl ?? ""), placeholderImage: UIImage(named: "deliveryIcon"), options: .refreshCached, completed: nil)
        
        detailsContainerView.addSubview(descriptionLabel)
        detailsContainerView.addSubview(imageView)
        
        //MARK -- ImageView
        //Leading
        detailsContainerView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: detailsContainerView, attribute: .leading, multiplier: 1, constant: 8))
        //Center Vertical
        detailsContainerView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: detailsContainerView, attribute: .centerY, multiplier: 1, constant: 0))
        //Width
        detailsContainerView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        //Height
        detailsContainerView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        
        //MARK -- Description Label
        //Leading
        detailsContainerView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1, constant: 8))
        //Trailing
        detailsContainerView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: detailsContainerView, attribute: .trailing, multiplier: 1, constant: -8))
        //Bottom
        detailsContainerView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: detailsContainerView, attribute: .bottom, multiplier: 1, constant: -8))
        //Top
        detailsContainerView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: detailsContainerView, attribute: .top, multiplier: 1, constant: 8))
    }
}
