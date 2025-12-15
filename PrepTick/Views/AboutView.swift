import SwiftUI

struct AboutView: View {
    private let appName: String = {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
            ?? "PrepTick"
    }()

    private let versionText: String = {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "–"
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "–"
        return "Version \(version) (\(build))"
    }()

    private let privacyPolicyURL = URL(string: "https://example.com/preptick/privacy")!
    private let supportEmailURL = URL(string: "mailto:support@preptick.app")!

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 4) {
                    Text(appName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(versionText)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }

            Section(header: Text("About PrepTick")) {
                Text("PrepTick keeps your presets in the spotlight so you can start multiple cooking timers in a grid, adjust names mid-cook, and repeat your last set with a tap.")
                Text("Favourite combinations stay close at hand and the calm design keeps the kitchen focused.")
            }

            Section(header: Text("Links")) {
                Link(destination: privacyPolicyURL) {
                    Label("Privacy Policy", systemImage: "lock.shield")
                }
                Link(destination: supportEmailURL) {
                    Label("Email Support", systemImage: "envelope")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle("About")
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
