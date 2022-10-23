//
//  User.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation


struct User: Identifiable{
    let id: String = UUID().uuidString
    var name: String
    var age: Int
    var gender: Gender
    var mood: Mood
    var budget: Double
    var promotionCode: PromotionCode
    var favouriteList: [Product<String>] = []
    var cart: [Product<String>] = []
    
    enum Gender{
        case male
        case female
        case unspecified
        case Empty
    }
    
    enum Mood{
        case happy
        case depressed
        case neutral
        case Empty
        
        func moodCompatibility(mood: Mood) -> [String]{
            switch mood{
            case .happy:
                return ["happiness","calmness","joy", "excitement", "romance"]
            case .depressed:
                return ["anger","boredom","disgust","sadness"]
            case .neutral:
                return ["romance"]
            case .Empty:
                return [""]
            }
        }
    }
    
    mutating func addToFavourites(product: Product<String>){
        favouriteList.append(product)
    }
    
    mutating func addToCart(product: Product<String>){
        cart.append(product)
    }

    mutating func usePromotionCode(){
        promotionCode = .None
    }
}


enum PromotionCode{
    case None
    case twentyFivePercent
    case fiftyPercent
    case Empty
}
