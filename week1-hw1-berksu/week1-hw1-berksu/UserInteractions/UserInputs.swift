//
//  UserInputs.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

/// It includes all of the user inputs.
struct UserInputs{
    
    static let shared = UserInputs()
    
    //Initializer access level change
    private init(){}
    
    // MARK: -User Inputs
    func getName() -> String{
        print("Enter your name:")
        if let username = readLine(){
            name = username
        }
        return name
    }
    
    
    func getAge() -> Int{
        repeat{
            print("Enter your age:")
            if let userAge = readLine(), userAge.isInt{
                if let userAgeInt = Int(userAge){
                    age = userAgeInt
                }
            }
        }while age <= 0
        return age
    }
    
    func getGender() -> User.Gender{
        print("Enter gender(male(m), female(m), unspecified(u)):")
        repeat{
            if let userGender = readLine(){
                switch userGender{
                case "m":
                    gender = .male
                case "f":
                    gender = .female
                case "u":
                    gender = .unspecified
                default:
                    gender = .Empty
                    print("Not a valid input !!! Re-enter gender(male(m), female(m), unspecified(u)):")
                }
            }
        }while gender == .Empty
        
        return gender
    }
    
    
    
    func getPromotionCode() -> PromotionCode{
        print("Enter the promotion code(none(n)/ %25(25) / %50(50)):")
        repeat{
            if let prCode = readLine(){
                switch prCode{
                case "50":
                    promotionCode = .fiftyPercent
                case "25":
                    promotionCode = .twentyFivePercent
                case "n":
                    promotionCode = .None
                default:
                    promotionCode = .Empty
                    print("Not a valid input !!! Re-enter the promotion code(none(n)/ %25(25) / %50(50)):")
                }
            }
        }while promotionCode == .Empty
        return promotionCode
    }
    
    func getMood() -> User.Mood{
        var mood: User.Mood = .Empty
        print("Enter the mood(Happy(h)/ Depressed(d) / Neutral(n)):")
        repeat{
            if let moodInp = readLine(){
                switch moodInp{
                case "h":
                    mood = .happy
                case "d":
                    mood = .depressed
                case "n":
                    mood = .neutral
                default:
                    mood = .Empty
                    print("Not a valid input !!! Re-enter the mood(Happy(h)/ Depressed(d) / Neutral(n)):")
                }
            }
        }while mood == .Empty
        return mood
    }
    
    func getBudget() -> Double{
        var budget: Double? = nil
        repeat{
            print("Enter your budget:")
            if let userBudget = readLine(){
                if userBudget.isInt || userBudget.isDouble{
                    budget = Double(userBudget)
                }
            }
        }while budget == nil
        return budget!
    }
    
    func getNumber(_ maxNumber: Int, content: String) -> Int?{
        print("Enter \(content) number:")
        repeat{
            if let number = readLine(){
                if number.isInt{
                    if let numberInt = Int(number), numberInt <= maxNumber && numberInt > 0{
                        return numberInt - 1
                    }
                }else if(number == "q"){
                    return nil
                }
            }
            
            print("Not a valid input !!! Re-enter \(content) number:")
        }while true
    }
    
    func productOperations(_ product: Product<String>){
        var isMenuAvailable = true
        print("Add to cart(c), Add to favourites(f), back to menu(m):")
        repeat{
            if let input = readLine(){
                switch input{
                case "c":
                    if user.cart.filter({ $0.content == product.content}).count == 0{
                        user.addToCart(product: product)
                    }else{
                        print("You have already added this mood to your cart")
                    }
                    isMenuAvailable = false
                case "f":
                    if user.cart.filter({ $0.content == product.content}).count == 0{
                        user.addToFavourites(product: product)
                    }else{
                        print("You have already added this mood to your favourites")
                    }
                    isMenuAvailable = false
                case "m":
                    isMenuAvailable = false
                default:
                    print("Not a valid input !!! Add to cart(a), Add to favourites(f), back to menu(m):")
                }
            }
        }while isMenuAvailable
    }
    
    func paymentMenu(){
        var isMenuAvailable = true
    
        print("To pay(p) / Clear the cart(c)/Back To Menu(m)")
        repeat{
            if let input = readLine(){
                switch input{
                case "p":
                    paymentMethod()
                    isMenuAvailable = false
                case "c":
                    user.cart = []
                    isMenuAvailable = false
                case "m":
                    print("quit")
                    isMenuAvailable = false
                default:
                    print("Not a valid input !!! To pay(p) / Clear the cart(c)/Back To Menu(m)")
                }
            }
        }while isMenuAvailable
    }

    
    func paymentMethod(){
        var isMenuAvailable = true
        print("Credit Card[Promotions cannot be used](c)/ Mood Payment System(m)/ Back to menu(b)")
        repeat{
            if let input = readLine(){
                switch input{
                case "c":
                    print("credit card")
                    pay(method: .creditCard)
                    isMenuAvailable = false
                case "m":
                    print("mood payment system")
                    pay(method: .moodPaymentSystem)
                    isMenuAvailable = false
                case "b":
                    print("quit")
                    isMenuAvailable = false
                default:
                    print("Not a valid input !!! Credit Card[Promotions cannot be used](c)/ Mood Payment System(m)/ Back to menu(b):")
                }
            }
        }while isMenuAvailable
    }
    
    func pay(method: PaymentMethods){
        var totalCost = 0.0
        var promotionUsable = true
        user.cart.forEach { product in
            totalCost += product.price
            promotionUsable = product.isPromotionUsable == false ? false:true
        }
        
        print("Total cost is \(totalCost)")
        
        if(method == .moodPaymentSystem){
            if(user.promotionCode != .Empty && user.promotionCode != .None){
                print("If you want to use your pormotion code press(p) else press any button")
                if let input = readLine(), input == "p"{
                    if(promotionUsable){
                        if(user.promotionCode == .fiftyPercent){
                            totalCost *= 0.5
                        }else{
                            totalCost *= 0.75
                        }
                        user.promotionCode = .None
                    }else{
                        print("You cannot use promotion code because some of moods do not accept promotion code.")
                    }
                }
            }
        }
        
        if(user.budget >= totalCost){
            user.budget -= totalCost
            print("Congragulations! You can use your new mood(s)")
            user.cart = []
        }else{
            print("Your budget is not enough to buy the mood(s)")
        }
    }
}
