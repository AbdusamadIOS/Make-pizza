//
//  Pizza.swift
//  Make pizza
//
//  Created by Abdusamad Mamasoliyev on 06/01/24.
//

import SwiftUI

// Pizza model

struct Pizza: Identifiable {
    
    var id = UUID().uuidString
    var breadName: String
    var toppings: [Topping] = []
}
  


