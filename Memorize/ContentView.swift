//
//  ContentView.swift
//  Memorize
//
//  Created by Kerem Ilgaz on 1.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis : Array<String> = ["❤️","💙","🤍","💛","❤️‍🩹","🩷","💜","🤎"]
    
    
    @State var cardCount : Int = 4
    @State var ThemeNumber: Int = 1
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle).foregroundColor(.black)
            ScrollView{
                Cards
            }
            .foregroundColor(.black)
            Spacer()
            //CardCountAdjuster
            ThemePicker
        }
        .padding()
    }
    
    var CardCountAdjuster: some View{
        HStack{
            CardAdder
            Spacer()
            CardRemover
        }.imageScale(.large)
    }
    
        
    var ThemePicker: some View{
        HStack{
            Button(action:{
                ThemeNumber = 1
                emojis = ["❤️", "💙", "🤍", "💛", "❤️‍🩹", "🩷", "💜", "🤎","❤️", "💙", "🤍", "💛", "❤️‍🩹", "🩷", "💜", "🤎"]
                emojis.shuffle()
            },label:{
                Image(systemName: "suit.heart")
            })
            Spacer()
            Button(action:{
                ThemeNumber = 2
                emojis = ["🇧🇷", "🇨🇦", "🇹🇷", "🇬🇧", "🇦🇺", "🇧🇧", "🇧🇼", "🇵🇹","🇧🇷", "🇨🇦", "🇹🇷", "🇬🇧", "🇦🇺", "🇧🇧", "🇧🇼", "🇵🇹"]
                emojis.shuffle()
            },label:{
                Image(systemName: "flag.filled.and.flag.crossed")
            })
            Spacer()
            Button(action:{
                ThemeNumber = 3
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
    func CardCountAdjuster(by offset: Int, symbol:String) -> some View{
        
            Button(action: {
                cardCount += offset
                
            }, label: {
                Image(systemName: symbol)
            })
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    
    var CardRemover : some View{
        return CardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var CardAdder : some View{
        return CardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
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
