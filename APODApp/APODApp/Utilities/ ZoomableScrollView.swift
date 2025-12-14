import SwiftUI

struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scroll = UIScrollView()
        scroll.maximumZoomScale = 4
        scroll.minimumZoomScale = 1
        scroll.delegate = context.coordinator
        
        let host = UIHostingController(rootView: content)
        host.view.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addSubview(host.view)
        
        NSLayoutConstraint.activate([
            host.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            host.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor)
        ])
        
        return scroll
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            scrollView.subviews.first
        }
    }
}

