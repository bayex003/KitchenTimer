import Foundation

struct UserDefaultsStore {
    static func save<T: Codable>(_ value: T, forKey key: String, defaults: UserDefaults = .standard) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(value)
            defaults.set(data, forKey: key)
        } catch {
            print("Failed to encode value for key \(key): \(error)")
        }
    }

    static func load<T: Codable>(_ type: T.Type, forKey key: String, defaults: UserDefaults = .standard) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch {
            print("Failed to decode value for key \(key): \(error)")
            return nil
        }
    }

    static func removeValue(forKey key: String, defaults: UserDefaults = .standard) {
        defaults.removeObject(forKey: key)
    }
}
