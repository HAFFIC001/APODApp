import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var apod: APOD?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = APODService()

    func loadToday() {
        Task { await fetchAPOD() }
    }

    func fetchAPOD(for date: Date? = nil) async {
        isLoading = true
        errorMessage = nil

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = date.map { formatter.string(from: $0) }

        do {
            apod = try await service.fetchAPOD(for: formattedDate)
        } catch {
            errorMessage = "Failed to load APOD. Tap Retry."
        }

        isLoading = false
    }
}

