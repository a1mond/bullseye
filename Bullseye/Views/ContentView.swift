//
//  ContentView.swift
//  Bullseye
//
//  Created by Владислав Котик on 28/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.5
    @State private var game = Game()
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game).padding(.bottom, alertIsVisible ? CGFloat(0) : CGFloat(100.0))
                if alertIsVisible {
                    PointsView(isPresented: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "Put the bullseye as close as you can to".uppercased())
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
        
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View { 
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("hit me".uppercased()).bold().font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(lineWidth: Constants.General.strokeWidth)
        )
        .alert(isPresented: $alertIsVisible, content: {
            let rounded: Int = Int(sliderValue.rounded())
            let gamePoints = game.points(sliderValue: rounded)
            return Alert(title: Text("Nice!"),
                         message: Text("Slider value is \(rounded)\n" + "You scored \(gamePoints) points this round"),
                         dismissButton: .default(Text("Awesome")) {
                            game.startNewRound(points: gamePoints)
                         }
            )
        })
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

