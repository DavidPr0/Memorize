//
//  ContentView.swift
//  Memorize
//
//  Created by David Freitas on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🕷️", "🎃", "😈", "😈"]
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        let Base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                Base.foregroundColor(.white)
                Base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
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
