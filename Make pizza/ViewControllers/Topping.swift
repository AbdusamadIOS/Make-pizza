//
//  Topping.swift
//  Make pizza
//
//  Created by Abdusamad Mamasoliyev on 07/01/24.
//

import SwiftUI

struct Topping: Identifiable {
    
    var id = UUID().uuidString
    var toppingName: String
    var isAdded: Bool = false
    var randomToppingPastions: [CGSize] = []
}
