//
//  ProgramOutputs.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

/// It includes all of the program messages to user.
struct ProgramOutputs{
    static let shared = ProgramOutputs()
    
    private init(){}
    
    
    func greetingsToUser(_ user: User){
        print("\nWelcome \(user.name), products that are suitable for your age(\(user.age)) is shown ")
    }
    
    func showUserOptions(){
        print("\n*********************************")
        print("Show all product list (a)")
        print("Show all recommended products (r)")
        print("Show all seller (s)")
        print("Show \(user.name)'s profile (p)")
        print("Show \(user.name)'s favourite products (f)")
        print("Show \(user.name)'s carts (c)")
        print("To quit(q)")
        print("*********************************\n")

    }
    
    func printSellers(){
        print("\n************ Seller List ************")
        for i in allSellers.indices{
            print("Seller \(i+1) -> name: \(allSellers[i].name)")
        }
        print("**************************************\n")
        print("If you want to see the details about seller please enter the seller number else press q")
    }
    
    func printProducts(){
        print("\n************ Product List ************")
        for i in allProducts.indices{
            print("Product \(i+1) -> name: \(allProducts[i].content)")
        }
        print("**************************************\n")
        print("If you want to see the details about product please enter the product number else press q")
    }
    
    func productDetails(_ product: Product<String>){
        print("\n************ Product Details ************")
        print("Name: \(product.content)")
        
        print("Price: \(product.price)")
        print("Promotion Usage: \(product.isPromotionUsable ? "possible":"none")")

        print("Average Point: \(product.point)")
        print("Comments:")
        product.comments.indices.forEach { i in
            print("  - \(product.points[i]), \(product.comments[i])")
        }
    }
    
    func sellerDetails(_ seller: Seller){
        print("\n************ Seller Details ************")
        print("Name: \(seller.name)")
        print("Point: \(seller.sellerPoint)")
        print("Promotion: \(seller.promotionValid ? "Accepted" : "Not Accepted")")
        
        print("Products:")
        for product in seller.mood{
            print("    - \(product.content)")
        }
    }
    
    func showUserProfile(_ user: User){
        print("\n************ User Profile ************")
        print("Name: \(user.name)")
        print("Age: \(user.age)")
        print("Gender: \(user.gender)")
        print("Mood: \(user.mood)")
        print("Budget: \(user.budget)")
        print("Promotion: \(user.promotionCode)")
        print("**************************************\n")
    }
    
    func showUserList(list: [Product<String>]){
        for product in list{
            print("    - \(product.content)")
        }
    }
    
    func showRecommended(){
        let recommendedListToUser = allProducts.filter({ product in
            user.mood.moodCompatibility(mood: user.mood).contains(product.content)
        })
        
        print("Recommended Products for \(user.name): ")
        showUserList(list: recommendedListToUser)
    }
}
