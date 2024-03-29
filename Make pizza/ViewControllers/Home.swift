//
//  Home.swift
//  Make pizza
//
//  Created by Abdusamad Mamasoliyev on 06/01/24.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.presentationMode) var presentation
    @State var pizzas: [Pizza] = [
        
        Pizza(breadName: "pizzab"),
        Pizza(breadName: "pizzab2")
    ]
    @State var currentPizza: String = "pizzab"
    @State var currentSize: PizzaSize = .medium
    
//    To add smooth slide effect
    @Namespace var animation
    let toppings : [String] = ["mol", "kalbasa", "tovuq", "qoziqorin", "zaytun", "piyoz", "pomidor", "balgar"]
    
    var body: some View {
        VStack{
            HStack{
//                Button {
//                } label: {
//                    Image(systemName: "arrow.left")
//                        .font(.title2)
//                        .foregroundColor(.black)
//                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
            .overlay(
            Text("Pizza")
                .font(.title2.bold())
                .foregroundColor(.black)
            )
            .padding()
            // Pizza view....
            GeometryReader { proxy in
                
                let size = proxy.size
                ZStack {
                    Image("tovoq")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal,30)
                        .padding(.vertical)
                    // Showing breads in swipe tabs...
                    TabView(selection: $currentPizza) {
                        
                        ForEach(pizzas) { pizza in
                            ZStack {
                                Image(pizza.breadName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(40)
                                
                                // Topping View...
                                ToppingsView(toppings: pizza.toppings, pizza: pizza, widht: (size.width / 2) - 45)
                            }
                            // Changing pizza size...
                            .scaleEffect(currentSize == .large ? 1 : (currentSize == .medium ? 0.95 : 0.9))
                            .tag(pizza.breadName)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(height: 300)
            
            // Price...
            Text("$17")
                .font(.title.bold())
                .foregroundColor(.black)
                .padding(.top,10)
            
            // Pizza size...
            HStack(spacing: 20) {
                
                ForEach(PizzaSize.allCases, id: \.rawValue) { size in
                    Button {
                        withAnimation {
                            currentSize = size
                        }
                    } label: {
                        Text(size.rawValue)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                ZStack {
                                    if currentSize == size {
                                Color.white
                                .clipShape(Circle())
                                // Shadow....
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.03), radius: 5, x: -5, y: -5)
                                .matchedGeometryEffect(id: "SIZEINDICATOR", in: animation)
                                }
                            }
                        )
                    }
                }
            }
            .padding(.top, 10)
            // Cutom Toppings...
            Text("Customize your Pizza")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
                .padding(.leading)
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack( spacing: -10) {
                        ForEach(toppings, id: \.self) { topping in
                            
                            // Displaying toping Image...
                            // There are total 10 topping images avialble for each topping...
                            // We simply shoing 3rd image as a main image...
                            Image("\(topping)_3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(14)
                                .background(Color.green
                                        .clipShape(Circle())
                                        .opacity(isAdded(topping: topping) ? 0.15 : 0.1)
                                        .animation(.easeInOut, value: currentPizza)
                                )
                                .padding()
                                .contentShape(Circle())
                                .onTapGesture {
                                    
                                    if isAdded(topping: topping) {
                                        // getting index and removing it
                                        if let index = pizzas[getIndex(breadName: currentPizza)].toppings.firstIndex(where: { currentTopping in
                                            return topping == currentTopping.toppingName
                                        }) {
                                            pizzas[getIndex(breadName: currentPizza)].toppings.remove(at: index)
                                        }
                                        return
                                    }
                                    // Creating some random position
                                    var positions: [CGSize] = []
                                    
                                    for _ in 1...16 {
                                        positions.append(.init(width: .random(in: -0...10), height: .random(in: -0...0)))
                                    }
                                    // Adding Topping....
                                    // Finding Index and toppinh..
                                    let toppingObject = Topping(toppingName: topping, isAdded: true, randomToppingPastions: positions)
                                    withAnimation {
                                        pizzas[getIndex(breadName: currentPizza)].toppings.append(toppingObject)
                                }
                            }
                                .tag(topping)
                        }
                    }
                }
                .onChange(of: currentPizza) { _,_ in
                    withAnimation {
                        proxy.scrollTo(toppings.first ?? "" , anchor: .leading)
                    }
                }
            }
            // Add to cart Button..
            Button {
                
            } label: {
                HStack(spacing: 15)  {
                   Image(systemName: "cart.fill")
                        .font(.title2)
                    Text("Add to cart")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 15))
            }
            // Making to all avialble
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    func isAdded(topping: String) -> Bool {
        
        let status = pizzas[getIndex(breadName: currentPizza)].toppings.contains() { currentTopping in
            return currentTopping.toppingName == topping
        }
        return status
    }
    
    func getIndex(breadName: String) -> Int {
        
        let index = pizzas.firstIndex { pizza in
            return pizza.breadName == breadName
        } ?? 0
        return index
    }
    
    @ViewBuilder
    func ToppingsView(toppings: [Topping], pizza: Pizza, widht: CGFloat) -> some View {
        Group {
            ForEach(toppings.indices, id: \.self) { index in
                let topping = toppings[index]
                ZStack {
                    // Adding more Topping Images
                    // with an illusion
                    ForEach(1...16, id: \.self) { subIndex in
                        // 360/10 = 36
                        let rotation: Double = Double(subIndex) * 36
                        let crtIndex = (subIndex > 8 ? (subIndex - 8) : subIndex)
                        Image("\(topping.toppingName)_\(crtIndex)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                        // Since index starts from 0...
                            .offset(x: (widht / 2) -
                                    topping.randomToppingPastions[subIndex - 1].width,
                                 y: topping.randomToppingPastions[subIndex - 1].height)
                            .rotationEffect(.init(degrees: rotation))
                        // Spreading Topping into random positions in 360 rotation..
                    }
                }
                // Adding Scaling Animation
                // Tiggering Scaling animation when the topping is added...
                .scaleEffect(topping.isAdded ? 1 : 16, anchor: .center)
            }
        }
    }
}

#Preview {
    Home()
}

enum PizzaSize: String, CaseIterable {
    
    case small = "S"
    case medium = "M"
    case large = "L"
}
