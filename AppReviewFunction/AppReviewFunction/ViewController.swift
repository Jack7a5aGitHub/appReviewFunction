//
//  ViewController.swift
//  AppReviewFunction
//
//  Created by Jack Wong on 2018/06/08.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
    private let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if model.isUserHighUsage() {
            let alert = AlertHelper.buildAlert(title: "Reviewか？", message: "5 Star欲しいよ <3", rightButtonTitle: "Review", leftButtonTitle: "Cancel", rightButtonAction: { (_) in
                if self.model.isUserReviewedAgain() {
                    self.model.reviewedTheApp()
                }else {
                    print("reivew after 30days ")
                }
            }) { (_) in
                print("Cancel")
            }
            present(alert, animated: true)
        }
    }
    
    @IBAction func reviewAction(_ sender: Any) {

        if UserDefaults.standard.integer(forKey: "appUsage") >= 10 {
        let alert = AlertHelper.buildAlert(title: "Reviewか？", message: "5 Star欲しいよ <3", rightButtonTitle: "Review", leftButtonTitle: "Cancel", rightButtonAction: { (_) in
           
                if UserDefaults.standard.object(forKey: "reviewedDate") != nil {
                    let reviewedDate = UserDefaults.standard.object(forKey: "reviewedDate") as? Date
                    print("Reviewed Date : \(reviewedDate)")
                let currentDate = Date().addingTimeInterval(-2592000)
                print("Currecnted Date - 30 days \(currentDate)")
                    if currentDate > reviewedDate! {
                        print("Is greater")
                SKStoreReviewController.requestReview()
                UserDefaults.standard.set(true, forKey: "isReviewed")
                UserDefaults.standard.set(Date(), forKey: "reviewedDate")
                    } else {
                        print("Please review after 30days ")
                    }
                } else {
                    print("first Time")
                    SKStoreReviewController.requestReview()
                    UserDefaults.standard.set(true, forKey: "isReviewed")
                    UserDefaults.standard.set(Date(), forKey: "reviewedDate")
                }
           
        }) { (_) in
            print("Cancel")
        }
        present(alert, animated: true)
   
        } else {
            print("Not yet active")
        }
        
}

}
