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
    let partner = User(name: "Pareja", emoji: "👽")

    VStack {
        // Vista individual (solo yo): usa customEmoji
        AccountCard(
            owner: me,
            bank: "Banorte",
            name: "Debit Card",
            balance: 1234567.8,
            color: .blue,
            customEmoji: "💳",
            showingAllUsers: false
        )

        // Vista individual (solo pareja): sin customEmoji → no emoji
        AccountCard(
            owner: partner,
            bank: "HSBC",
            name: "Credit Card",
            balance: 98765.43,
            color: .orange,
            customEmoji: nil,
            showingAllUsers: false
        )

        // Vista compartida: muestra emoji del dueño
        AccountCard(
            owner: partner,
            bank: "BBVA",
            name: "Savings",
            balance: 55555.0,
            color: .blue,
            customEmoji: "💵",
            showingAllUsers: true
        )
    }
    .padding()
}
