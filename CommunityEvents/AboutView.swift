//
//  AboutView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct AboutView: View {
    let viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.getEvents()
                } catch {
                    print("Error", error)
                }
            }
        }
        .navigationTitle("About Us")
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(viewModel: ContentViewModel())
    }
}
