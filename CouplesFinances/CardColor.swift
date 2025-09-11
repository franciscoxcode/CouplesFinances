//
//  CardColor.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//

import SwiftUI

struct CardColor {
    let background: Color
    let accent: Color

    // Presets iniciales (empezamos con 2 para ir micro)
    static let blue = CardColor(
        background: Color.blue.opacity(0.10),
        accent: Color.blue
    )

    static let orange = CardColor(
        background: Color.orange.opacity(0.12),
        accent: Color.orange
    )
    
    static let green = CardColor(
        background: Color.green.opacity(0.12),
        accent: Color.green
    )

    static let red = CardColor(
        background: Color.red.opacity(0.12),
        accent: Color.red
    )

    static let purple = CardColor(
        background: Color.purple.opacity(0.12),
        accent: Color.purple
    )

    static let indigo = CardColor(
        background: Color.indigo.opacity(0.12),
        accent: Color.indigo
    )

    static let brown = CardColor(
        background: Color.brown.opacity(0.12),
        accent: Color.brown
    )

    static let yellow = CardColor(
        background: Color.yellow.opacity(0.18), // un poco más visible
        accent: Color.yellow
    )

    static let mint = CardColor(
        background: Color.mint.opacity(0.12),
        accent: Color.mint
    )

    static let gray = CardColor(
        background: Color.gray.opacity(0.12),
        accent: Color.gray
    )
}
