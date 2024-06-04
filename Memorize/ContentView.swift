//
//  ContentView.swift
//  Memorize
//
//  Created by Kerem Ilgaz on 1.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.black)
        .padding()
    }
}

struct CardView: View{
    @State var isFaceUp = false
    let base = RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
    var body: some View{
        ZStack {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text("❤️").font(.largeTitle)
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
