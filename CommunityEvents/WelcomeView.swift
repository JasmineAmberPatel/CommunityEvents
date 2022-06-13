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
            Group {
                Image("Community-Events")
                Text("Discover community events near you")
                    .font(.title)
                    .bold()
                    .padding([.leading, .trailing])
                    .foregroundColor(Color.ceGreen)
                Text("We aim to celebrate our local community by bringing people and places together.")
                    .foregroundColor(Color.ceGreen)
                    .font(.headline)
                    .bold()
                    .padding(.bottom, 15)
                    .padding([.leading, .trailing], 30)
                NavigationLink(destination: MapView(), label: {
                    Text("Explore")
                        .bold()
                })
                .frame(width: 200, height: 53, alignment: .center)
                .background(Color.ceGreen)
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .offset(y: -50)
            .padding(.bottom, 15)
            .multilineTextAlignment(.center)
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
