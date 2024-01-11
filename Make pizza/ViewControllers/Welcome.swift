//
//  Welcome.swift
//  Make pizza
//
//  Created by Abdusamad Mamasoliyev on 07/01/24.
//

import SwiftUI

struct Welcome: View {
    
    @State var isModal: Bool = false

    var body: some View {
        ZStack {
            Color.sariq
                .ignoresSafeArea()
            VStack {
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 0)
                    .padding(.vertical, 100)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                Button("Make Pizza") {
                    self.isModal = true
                }.fullScreenCover(isPresented: $isModal, content: {
                    Home()
                })
                .frame(width: 200, height: 70)
                .font(.title.bold())
                .foregroundColor(.white)
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 20)
                .padding()
                
            }
        }
    }
}

#Preview {
    Welcome()
}
