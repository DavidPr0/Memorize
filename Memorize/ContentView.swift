//
//  ContentView.swift
//  Memorize
//
//  Created by David Freitas on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        let Base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                Base.foregroundColor(.white)
                Base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                Base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        .foregroundColor(.orange)
        .padding()
    }
}
#Preview {
    ContentView()
}
