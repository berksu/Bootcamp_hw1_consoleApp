//
//  DoubleExtension.swift
//  week1-hw1-berksu
//
//  Created by Berksu Kısmet on 25.09.2022.
//

import Foundation

extension Double{
    var twoDigits: String{
        String(format: "%.2f", self)
    }
}
