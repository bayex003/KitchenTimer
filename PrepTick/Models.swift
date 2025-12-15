import Foundation
import SwiftUI

enum Category: String, Codable, CaseIterable, Identifiable {
    case breakfast
    case lunch
    case dinner
    case beverage
    case dessert
    case prep

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        case .beverage: return "Beverage"
        case .dessert: return "Dessert"
        case .prep: return "Prep"
        }
    }

    var icon: String {
        switch self {
        case .breakfast: return "sunrise.fill"
        case .lunch: return "fork.knife"
        case .dinner: return "moon.stars.fill"
        case .beverage: return "cup.and.saucer.fill"
        case .dessert: return "birthday.cake.fill"
        case .prep: return "timer"
        }
    }
}

struct Preset: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var durationSeconds: Int
    var category: Category

    init(id: UUID = UUID(), name: String, durationSeconds: Int, category: Category) {
        self.id = id
        self.name = name
        self.durationSeconds = durationSeconds
        self.category = category
    }
}

struct RunningTimer: Identifiable, Codable, Equatable {
    let id: UUID
    var preset: Preset
    var startedAt: Date
    var remainingSeconds: Int

    init(id: UUID = UUID(), preset: Preset, startedAt: Date = .now, remainingSeconds: Int) {
        self.id = id
        self.preset = preset
        self.startedAt = startedAt
        self.remainingSeconds = remainingSeconds
    }
}

struct Settings: Codable, Equatable {
    var notificationsEnabled: Bool
    var accentColorHex: String

    init(notificationsEnabled: Bool = true, accentColorHex: String = "#88A096") {
        self.notificationsEnabled = notificationsEnabled
        self.accentColorHex = accentColorHex
    }

    var accentColor: Color { Color(hex: accentColorHex) }
}

struct LastSet: Identifiable, Codable, Equatable {
    let id: UUID
    var presetID: UUID
    var setAt: Date

    init(id: UUID = UUID(), presetID: UUID, setAt: Date = .now) {
        self.id = id
        self.presetID = presetID
        self.setAt = setAt
    }
}
