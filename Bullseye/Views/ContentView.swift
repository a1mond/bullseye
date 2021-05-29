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
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Put the bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .padding()
                
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
                .padding()
                
                Button(action: {
                    alertIsVisible = true
                    print("Button is pressed.")
                }) {
                    Text("submit".uppercased()).bold().font(.title3)
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
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

