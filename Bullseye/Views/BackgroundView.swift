//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Владислав Котик on 30/05/2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
    }
}
struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack {
                ForEach(1..<6) { ring in
                    let size = CGFloat(ring * 100)
                    let opacity = colorScheme == .dark ? 0.1 : 0.3
                    Circle()
                        .stroke(lineWidth: 20.0)
                        .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.8 * opacity), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                        .frame(width: size, height: size)
                }
            }
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "points".uppercased(), text: String(game.score))
            Spacer()
            NumberView(title: "round".uppercased(), text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BackgroundView(game: .constant(Game()))
        }
        VStack {
            BackgroundView(game: .constant(Game())).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
