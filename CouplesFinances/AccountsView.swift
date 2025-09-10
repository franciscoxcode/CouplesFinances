//
//  AccountsView.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//
import SwiftUI

struct AccountsView: View {
    let sampleAccounts = Array(1...10).map { "Account \($0)" }
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Accounts")
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(sampleAccounts, id: \.self) { account in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 120, height: 80)
                            .overlay(
                                Text(account)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            )
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    AccountsView()
}
