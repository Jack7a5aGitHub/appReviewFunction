//
//  Model.swift
//  AppReviewFunction
//
//  Created by Jack Wong on 2018/06/11.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import Foundation
import StoreKit

final class Model {
    
    func getUserUsage() -> Int{
        var usageCount = UserDefaults.standard.integer(forKey: "appUsage")
        print(usageCount)
        //Update deletedMails count
        usageCount += 1
        //Set
        UserDefaults.standard.set(usageCount, forKey: "appUsage")
        print(usageCount)
        return usageCount
    }
    
    func isUserHighUsage() -> Bool {
        if getUserUsage() >= 10 {
            return true
        }
        return false
    }
    
    func reviewedTheApp(){
        SKStoreReviewController.requestReview()
        UserDefaults.standard.set(true, forKey: "isReviewed")
        UserDefaults.standard.set(Date(), forKey: "reviewedDate")
    }
    
    func isUserReviewedAgain() -> Bool {
         let currentDate = Date().addingTimeInterval(-2592000)
        let reviewedDate = UserDefaults.standard.object(forKey: "reviewedDate") as? Date
        if reviewedDate == nil {
            return true
        }
        else if currentDate > reviewedDate! {
            return true
        }
        return false 
    }
}
