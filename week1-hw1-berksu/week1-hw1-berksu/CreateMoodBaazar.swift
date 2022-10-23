//
//  CreateMoodBaazar.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

// Mock data
struct CreateMoodBaazar{
    
    static var shared = CreateMoodBaazar()
    private init(){}
    
    let moodTypes = ["happiness",
                    "anger",
                    "boredom",
                    "calmness" ,
                    "disgust",
                    "joy",
                    "excitement",
                    "sadness",
                    "romance"]
    
    let prices = [100.0,20.0,40.0,80.0,10.0,100.0,60.0,25.0,70.0]
    let promotions = [true, true, false,false,true, false,true, true, true]
    
    let commentsOfProducts = [["great effect on me", "amazing mood", "it doesn't help me"],
                    ["I feel angry it works", "be careful about using it"],
                    ["I am bored now", "I want to kill myself"],
                    ["I suggest it to my son", "I always using it in exams"],
                    [ "Disgusting :("],
                    ["It cahnges my mood totally", "Great seller"],
                    [ "I couldnt wait to use it",  "Next time I won't buy form this seller",  "Seller is rude"],
                    ["I am so sad",  "Great seller, he warned me about the side effects"],
                    [ "I will use it on my boyfriend"]]
    
    let commentPoints = [[4.0,5.0,1.0], [5.0,1.0],[1.0,1.0],[5.0,4.0],[2.0],[4.0,5.0],[5.0,2.0,1.0],[3.0,5.0],[5.0]]
    
    func createProductList() -> [Product<String>]{
        var productArray = Array<Product<String>>()
        for i in moodTypes.indices{
            productArray.append(Product<String>(content: moodTypes[i],
                                            isPromotionUsable: promotions[i],
                                            price: prices[i],
                                            comments: commentsOfProducts[i],
                                            points: commentPoints[i]))
        }
        return productArray
    }
    
    func createSellers() -> [Seller]{
            [Seller(name: "Euphrosyne", sellerPoint: 4.6, mood: allProducts.filter{$0.content == "joy" || $0.content == "excitement" || $0.content == "happiness"}),
                          Seller(name: "Oizys", sellerPoint: 2.0, mood: allProducts.filter{$0.content == "boredom" || $0.content == "disgust" || $0.content == "sadness" || $0.content == "anger"}),
                          Seller(name: "Anteros", sellerPoint: 4.3, mood: allProducts.filter{$0.content == "calmness" || $0.content == "romance"}),
                          Seller(name: "Zeus", sellerPoint: 3.6, mood: allProducts)]
    }
}
