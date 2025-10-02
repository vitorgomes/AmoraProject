//
//  NavigationDestination.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 02/10/25.
//

import Foundation

enum NavigationDestination: Hashable {
    case notifications
    case messages
    case chat(userName: String, userImage: String, isOnline: Bool, lastTimeOnline: Int?, timeUnit: String?)
}
