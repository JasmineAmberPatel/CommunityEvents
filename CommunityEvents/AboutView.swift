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
            Text("Welcome!")
                .font(.largeTitle)
                .bold()
                .padding(20)
            Text("Discover community events near you.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(Color.ceOrange)
        .onAppear {
            Task {
                do {
                    try await viewModel.getEvents()
                } catch {
                    print("Error", error)
                }
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(viewModel: ContentViewModel())
    }
}
