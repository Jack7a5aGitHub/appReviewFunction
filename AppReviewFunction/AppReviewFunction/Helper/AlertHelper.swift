//
//  AlertHelper.swift
//  AppReviewFunction
//
//  Created by Jack Wong on 2018/06/08.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import Foundation

import UIKit

final class AlertHelper {
    
    static func buildAlert(title: String = "",
                           message: String,
                           rightButtonTitle: String = "ALERT_OK",
                           leftButtonTitle: String? = nil,
                           rightButtonAction: ((UIAlertAction) -> Void)? = nil,
                           leftButtonAction: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: rightButtonTitle, style: .default, handler: rightButtonAction)
        alert.addAction(positiveAction)
        
        if let leftButtonTitle = leftButtonTitle {
            let negativeAction = UIAlertAction(title: leftButtonTitle, style: .cancel, handler: leftButtonAction)
            alert.addAction(negativeAction)
        }
        return alert
    }
}
