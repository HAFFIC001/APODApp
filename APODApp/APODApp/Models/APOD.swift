import Foundation

struct APOD: Codable, Identifiable {
    var id: String { date }
    
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String?
    let media_type: String
    let title: String
    let url: String
}

