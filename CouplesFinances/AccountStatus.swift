//
//  AccountStatus.swift
//  CouplesFinances
//
//  Created by Francisco Jean on 10/09/25.
//
import Foundation

enum AccountStatus {
    case included     // líquido + consolidado
    case excluded     // fuera de todo
    case frozen       // solo consolidado
}
