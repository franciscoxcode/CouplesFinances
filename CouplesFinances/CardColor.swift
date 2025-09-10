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
}
