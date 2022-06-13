//
//  WelcomeView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct WelcomeView: View {
    var viewModel: ContentViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("Community-Events")
                .offset(y: -50)
            Text("Discover community events near you")
                .font(.title)
                .bold()
                .padding(.bottom, 15)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
                .foregroundColor(Color.ceGreen)
                .offset(y: -50)
            Text("We aim to celebrate our local community by bringing people and places together.")
                .foregroundColor(Color.ceGreen)
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .padding([.leading, .trailing], 30)
                .offset(y: -50)
            NavigationLink(destination: MapView(), label: {
                Text("Explore")
                    .bold()
            })
            .frame(width: 200, height: 53, alignment: .center)
            .background(Color.ceGreen)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.bottom, 15)
            .shadow(radius: 5)
            .offset(y: -50)
            Spacer()
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.black)
        .background(Color.ceOrange)
    }
    
    struct Welcome_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView(viewModel: ContentViewModel())
        }
    }
}
