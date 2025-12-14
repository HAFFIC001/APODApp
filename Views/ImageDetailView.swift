import SwiftUI

struct ImageDetailView: View {
    let url: String
    
    var body: some View {
        ZoomableScrollView {
            AsyncImage(url: URL(string: url)) { img in
                img.resizable()
                   .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .background(Color.black)
    }
}

