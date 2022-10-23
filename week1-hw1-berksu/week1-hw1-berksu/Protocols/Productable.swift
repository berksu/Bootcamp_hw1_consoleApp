//
//  Productable.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

protocol Productable{
    associatedtype ProductContent
    
    var content: ProductContent{get}
    var isPromotionUsable: Bool{get}
    var price: Double{get}
    var psychologyRestriction: [String]{get}
    var comments: [String]{get set}
    var points: [Double]{get set}
}
