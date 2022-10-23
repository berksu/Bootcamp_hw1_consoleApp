//
//  Product.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

struct Product<ProductContent>: Productable {
    var content: ProductContent
    var isPromotionUsable: Bool
    var price: Double
    var psychologyRestriction: [String] = []
    var point: Double{
        var averagePoint = 0.0
        points.forEach { averagePoint += $0}
        return averagePoint == 0 ? 0.0 : averagePoint / Double(comments.count)
    }
    var comments: [String]
    var points: [Double]
}


enum PaymentMethods{
    case moodPaymentSystem
    case creditCard
}
