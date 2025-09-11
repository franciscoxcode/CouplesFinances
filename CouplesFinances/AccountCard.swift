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
    var status: AccountStatus
    var backgroundColor: Color {
        switch status {
        case .included:
            return color.background  // normal, usa la paleta
        case .excluded:
            return Color.gray.opacity(0.2) // fondo grisáceo
        case .frozen:
            return color.background.opacity(0.4) // mismo color, pero apagado/translúcido
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
            .frame(width: 150)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
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

    VStack(spacing: 20) {
        // Included (normal)
        AccountCard(
            owner: me,
            bank: "Banorte",
            name: "Debit Card",
            balance: 12345.67,
            color: .blue,
            customEmoji: "💳",
            showingAllUsers: false,
            status: .included
        )

        // Excluded (gris)
        AccountCard(
            owner: me,
            bank: "HSBC",
            name: "Retirement Fund",
            balance: 98765.43,
            color: .orange,
            customEmoji: "🏦",
            showingAllUsers: false,
            status: .excluded
        )

        // Frozen (atenuado)
        AccountCard(
            owner: me,
            bank: "BBVA",
            name: "Investment",
            balance: 55555.00,
            color: .green,
            customEmoji: "❄️",
            showingAllUsers: false,
            status: .frozen
        )
    }
    .padding()
}
