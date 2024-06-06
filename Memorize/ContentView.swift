//
//  ContentView.swift
//  Memorize
//
//  Created by Kerem Ilgaz on 1.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis : Array<String> = ["❤️","💙","🤍","💛","❤️‍🩹","🩷","💜","🤎"]
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle).foregroundColor(.black)
            ScrollView{
                Cards
            }
            .foregroundColor(.black)
            Spacer()
            ThemePicker
        }
        .padding()
    }
    


    var ThemePicker: some View{
        HStack{
            Button(action:{
                emojis = ["❤️", "💙", "🤍", "💛", "❤️‍🩹", "🩷", "💜", "🤎","❤️", "💙", "🤍", "💛", "❤️‍🩹", "🩷", "💜", "🤎"]
                emojis.shuffle()
            },label:{
                Image(systemName: "suit.heart")
            })
            Spacer()
            Button(action:{
                emojis = ["🇧🇷", "🇨🇦", "🇹🇷", "🇬🇧", "🇦🇺", "🇧🇧", "🇧🇼", "🇵🇹","🇧🇷", "🇨🇦", "🇹🇷", "🇬🇧", "🇦🇺", "🇧🇧", "🇧🇼", "🇵🇹"]
                emojis.shuffle()
            },label:{
                Image(systemName: "flag.filled.and.flag.crossed")
            })
            Spacer()
            Button(action:{
                emojis =  ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒","🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒"]
                emojis.shuffle()
            },label:{
                Image(systemName: "car")
            })
        }.imageScale(.large).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
       
    var Cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 60))]){
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/3,contentMode: .fit)
        }
    }

}

struct CardView: View{
    let content : String
    @State var isFaceUp = false
    let base = RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
    var body: some View{
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
