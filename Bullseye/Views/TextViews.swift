//
//  TextViews.swift
//  Bullseye
//
//  Created by Владислав Котик on 30/05/2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}
struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(width: 35.0)
    }
}
struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
    }
}
struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            
    }
}
struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
            .font(.body)
            
    }
}
struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "instruction")
            BigNumberText(text: "10")
            SliderLabelText(text: "10")
            LabelText(text: "label")
            BodyText(text: "You scored 79 points!")
            ButtonText(text: "Button")
        }
    }
}
