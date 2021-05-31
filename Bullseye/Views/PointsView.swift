//
//  PointsView.swift
//  Bullseye
//
//  Created by Владислав Котик on 30/05/2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var isPresented: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let rounded = Int(sliderValue.rounded())
        let points = game.points(sliderValue: rounded)
        VStack(spacing: 10) {
            InstructionText(text: "the slider's value is")
            BigNumberText(text: String(rounded))
            BodyText(text: "You've scored \(points) Points\nGood job!")
            Button(action: {
                withAnimation {
                    isPresented = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start new round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(isPresented: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(isPresented: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(isPresented: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(isPresented: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
