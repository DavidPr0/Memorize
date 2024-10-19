//
//  ContentView.swift
//  Memorize
//
//  Created by David Freitas on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🕷️", "🎃", "😈", "🕸️", "👹", "☠️", "🍭", "😰", "🧙🏼‍♂️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String ) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        let Base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                Base.fill(.white)
                Base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            Base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}
