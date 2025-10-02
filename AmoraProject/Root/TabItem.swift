//
//  TabItem.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 02/10/25.
//

import Foundation

enum TabItem: Int, CaseIterable {
    case feed = 0
    case search
    case newPost
    case reels
    case profile
    
    var icon: String {
        switch self {
        case .feed: return "house" // TODO: Change
        case .search: return "magnifyingglass"
        case .newPost: return "plus.app"
        case .reels: return "movieclapper" // TODO: Change
        case .profile: return "person.circle"
        }
    }
    
    var iconFilled: String {
        switch self {
        case .feed: return "house.fill"
        case .search: return "magnifyingglass"
        case .newPost: return "plus.app.fill"
        case .reels: return "movieclapper.fill"
        case .profile: return "person.circle.fill"
        }
    }
    
    var title: String {
        switch self {
        case .feed: return "Home"
        case .search: return "Buscar"
        case .newPost: return "Criar"
        case .reels: return "Reels"
        case .profile: return "Perfil"
        }
    }
}
