//
//  ContentView.swift
//  Bullseye
//
//  Created by Владислав Котик on 28/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        VStack {
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                alertIsVisible = true
                print("Button is pressed.")
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let rounded: Int = Int(sliderValue.rounded())
                return Alert(title: Text("Nice!"),
                             message: Text("Slider value is \(rounded)\n" + "You scored \(game.points(sliderValue: rounded)) points this round"),
                             dismissButton: .default(Text("Awesome"))
                )
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

