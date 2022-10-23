//
//  main.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation


var welcomeMessage = WelcomeMessage()
print(welcomeMessage.message)
print("To see the welcome message correctly please adjust the widht of the console\n")
print("You are in the best mood store. You can buy new moods according to your current mood. Please enter your information and live the dream :)\n")


var name = UserInputs.shared.getName()
var age = UserInputs.shared.getAge()
var gender = UserInputs.shared.getGender()
var mood = UserInputs.shared.getMood()
var budget = UserInputs.shared.getBudget()
var promotionCode = UserInputs.shared.getPromotionCode()

// -Mark: Create Mood Baazar Elements
var user = User(name: name, age: age, gender: gender, mood: mood, budget: budget ,promotionCode: promotionCode)
var allProducts = CreateMoodBaazar.shared.createProductList()
var allSellers =  CreateMoodBaazar.shared.createSellers()


// -Mark: Greeting
ProgramOutputs.shared.greetingsToUser(user)

// -Mark: Main Menu
var menuActivated = true
repeat{
    ProgramOutputs.shared.showUserOptions()

    if let option = readLine(){
        switch option{
        case "a":
            ProgramOutputs.shared.printProducts()
            if let chosen = UserInputs.shared.getNumber(allProducts.count, content: "product"){
                ProgramOutputs.shared.productDetails(allProducts[chosen])
                UserInputs.shared.productOperations(allProducts[chosen])
            }
        case "s":
            ProgramOutputs.shared.printSellers()
            if let chosenSeller = UserInputs.shared.getNumber(allSellers.count, content: "seller"){
                ProgramOutputs.shared.sellerDetails(allSellers[chosenSeller])
            }
        case "p":
            ProgramOutputs.shared.showUserProfile(user)
        case "r":
            ProgramOutputs.shared.showRecommended()
        case "f":
            print("\(user.name)'s Favourites")
            if(user.favouriteList.count == 0){
                print("Empty")
                continue
            }
            ProgramOutputs.shared.showUserList(list: user.favouriteList)
        case "c":
            print("\(user.name)'s Cart")
            if(user.cart.count == 0){
                print("Empty")
            }else{
                ProgramOutputs.shared.showUserList(list: user.cart)
                UserInputs.shared.paymentMenu()
            }
        case "q":
            print("Good bye :(")
            menuActivated = false
        default:
            print("Not a valid input !!!")
        }
    }
}while menuActivated
