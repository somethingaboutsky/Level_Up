//
//  InteractiveMapView.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 03/12/24.
//

import SwiftUI
import WebKit

struct InteractiveMapView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Binding var guideURL: URL
    
    var body: some View {
        VStack {
            HStack() {
                Text("Mappa Interattiva")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            WebView(url: guideURL)
            HStack {
                Text("(Powered by MapGenie.io)")
                    .font(.caption)
                Spacer()
            }
        }
        .frame(width: screenWidth, height: screenHeight - 240)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    InteractiveMapView(guideURL: .constant(URL(string: "https://mapgenie.io/assassins-creed/maps/the-holy-land")!))
}


struct WebView: UIViewRepresentable {
    let url: URL

    class Coordinator: NSObject, WKNavigationDelegate {
            var parent: WebView

            init(parent: WebView) {
                self.parent = parent
            }

            func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
                guard let host = navigationAction.request.url?.host else {
                    decisionHandler(.cancel)
                    return
                }

                // Blocca i siti indesiderati
                if host.contains("ads") || host.contains("tracking") || host.contains("pubblicita") || host.contains("ad") || host.contains("advertisement") {
                    decisionHandler(.cancel)
                } else {
                    decisionHandler(.allow)
                }
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }

        func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            webView.navigationDelegate = context.coordinator
            return webView
        }

        func updateUIView(_ uiView: WKWebView, context: Context) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
}
