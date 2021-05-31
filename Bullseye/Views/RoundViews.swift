//
//  RoundViews.swift
//  Bullseye
//
//  Created by Владислав Котик on 30/05/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled : View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}
struct RoundedTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title )
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .font(.title2)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: Constants.General.spacing) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "999")
            RoundedTextView(text: "1")
        }
        VStack(spacing: Constants.General.spacing) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            RoundedImageViewFilled(systemName: "list.dash")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

