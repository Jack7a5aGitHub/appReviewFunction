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

    override func viewDidLoad() {
        super.viewDidLoad()
        SKStoreReviewController.requestReview()
    }

}

