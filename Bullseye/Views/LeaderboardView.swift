//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Владислав Котик on 31/05/2021.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: Constants.General.spacing) {
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                        .padding(.top)
                    
                    LabelView()
                    ForEach(game.leaderboardEntries.indices) { i in
                        RowView(index: i + 1, score: game.leaderboardEntries[i].score, date: game.leaderboardEntries[i].date)
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(text: String(score))
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "leaderboard").padding(.leading, 20.0)
                    Spacer()
                } else {
                    BigBoldText(text: "leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "time")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        .padding(.horizontal)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var lis = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: lis, game: game)
        LeaderboardView(leaderboardIsShowing: lis, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: lis, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: lis, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
