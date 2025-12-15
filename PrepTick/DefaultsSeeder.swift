import Foundation

struct DefaultsSeeder {
    static func seedPresets() -> [Preset] {
        let defaults: [(String, Int, Category)] = [
            ("Soft Boiled Eggs", 360, .breakfast),
            ("Hard Boiled Eggs", 600, .breakfast),
            ("Overnight Oats", 300, .breakfast),
            ("French Press Coffee", 240, .beverage),
            ("Drip Coffee Warm", 300, .beverage),
            ("Iced Tea Brew", 900, .beverage),
            ("Pasta Al Dente", 480, .lunch),
            ("Rice (Jasmine)", 900, .lunch),
            ("Quinoa", 960, .lunch),
            ("Roast Chicken Rest", 900, .dinner),
            ("Steak Rest", 420, .dinner),
            ("Salmon Bake", 720, .dinner),
            ("Brownies", 1500, .dessert),
            ("Cookies", 720, .dessert),
            ("Cheesecake Chill", 14400, .dessert),
            ("Marinade", 3600, .prep),
            ("Dough Proof", 7200, .prep),
            ("Preheat Oven", 600, .prep)
        ]

        return defaults.map { Preset(name: $0.0, durationSeconds: $0.1, category: $0.2) }
    }
}
