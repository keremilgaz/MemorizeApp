//
//  ContentView.swift
//  Memorize
//
//  Created by Kerem Ilgaz on 1.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis : Array<String> = ["❤️","💙","🤍","💛"]
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }

        }
        .foregroundColor(.black)
        .padding()
    }
}

struct CardView: View{
    let content : String
    @State var isFaceUp = false
    let base = RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
    var body: some View{
        ZStack {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text(content).font(.largeTitle)
            }
            else{
                base.fill().strokeBorder(.gray)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
