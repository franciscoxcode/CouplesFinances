//
//  AccountCard.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//

import SwiftUI

struct AccountCard: View {
    var owner: User
    var bank: String
    var name: String
    var balance: Double
    var color: CardColor
    var customEmoji: String?
    var showingAllUsers: Bool
    var emojiToShow: String? {
        if showingAllUsers {
            return owner.emoji
        } else {
            return customEmoji
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Tarjeta
            VStack(alignment: .leading, spacing: 4) {
                Text(bank)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .padding(.bottom, 10)
                
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .padding(.bottom, 3)
                
                Text(balance, format: .currency(code: "MXN"))
                    .font(.headline)
                    .bold()
                    .foregroundColor(color.accent)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .padding()
            .frame(minWidth: 150)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.background)
            )
            
            // Emoji como sticker
            if let emojiToShow {
                Text(emojiToShow)
                    .font(.system(size: 22))
                    .padding(10)
            }
        }
    }
}

    #Preview {
        let me = User(name: "Benja", emoji: "🐱")

        let allColors: [CardColor] = [
            .blue, .orange, .green, .red, .purple, .indigo, .brown, .yellow, .mint, .gray
        ]

        // Dos filas en scroll horizontal
        let rows = [
            GridItem(.fixed(120)),
            GridItem(.fixed(120))
        ]

        return ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(Array(allColors.enumerated()), id: \.offset) { index, color in
                    AccountCard(
                        owner: me,
                        bank: "Demo Bank",
                        name: "Account \(index + 1)",
                        balance: Double.random(in: 1000...100000),
                        color: color,
                        customEmoji: nil,
                        showingAllUsers: false
                    )
                }
            }
            .padding()
        }
    }
