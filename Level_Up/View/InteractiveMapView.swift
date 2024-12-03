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

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
