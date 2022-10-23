//
//  StringExtension.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

// MARK: -Extensions
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var isDouble: Bool {
        return Double(self) != nil
    }
}

