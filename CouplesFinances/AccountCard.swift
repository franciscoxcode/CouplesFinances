//
//  AccountCard.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//

import SwiftUI

struct AccountCard: View {
    var emoji: String
    var bank: String
    var name: String
    var balance: Double
    var color: CardColor
    
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
            Text(emoji)
                .font(.system(size: 22))
                .padding(10)
        }
    }
}

#Preview {
    VStack {
        
        AccountCard(
            emoji: "🐱",
            bank: "Banorte",
            name: "Debit Card",
            balance: 1234567.8,
            color: .blue
        )
        
        AccountCard(
            emoji: "👽",
            bank: "HSBC",
            name: "Credit Card",
            balance: 98765.43,
            color: .orange
        )
    }
    .padding()
}
