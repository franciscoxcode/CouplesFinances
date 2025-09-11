//
//  AccountsView.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//
import SwiftUI

struct AccountsView: View {
    let me = User(name: "Benja", emoji: "🐱")
    let partner = User(name: "Pareja", emoji: "👽")

    let allColors: [CardColor] = [
        .blue, .orange, .green, .red, .purple,
        .indigo, .brown, .yellow, .mint
    ]

    let rows = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Accounts")
                .font(.title2)
                .padding(.bottom, 10)

            GeometryReader { geo in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 16) {
                        ForEach(Array(allColors.enumerated()), id: \.offset) { index, color in
                            AccountCard(
                                owner: index % 2 == 0 ? me : partner,
                                bank: "Demo Bank",
                                name: "Account \(index + 1)",
                                balance: Double.random(in: 1000...100000),
                                color: color,
                                customEmoji: nil,
                                showingAllUsers: false,
                                status: {
                                    switch index % 3 {
                                    case 0: return .included
                                    case 1: return .excluded
                                    default: return .frozen
                                    }
                                }()
                            )
                        }
                    }
                    .frame(height: geo.size.height) // 👈 el grid ocupa solo el alto disponible
                }
            }
            .frame(height: 250)
        }
        .padding(.horizontal, 22)
    }
}

#Preview {
    AccountsView()
}
