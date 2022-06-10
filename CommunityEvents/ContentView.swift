//
//  ContentView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    let event: Event
    let viewModel: ContentViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: event.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color.ceOrange
                }
                .frame(width: 340, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Group {
                    Text(event.title)
                        .font(.title)
                        .padding(.bottom, 10)
                    HStack(alignment: .center)  {
                    Image(systemName: "calendar")
                    Text("Date and Time")
                        .font(.headline)
                    }
                    Text("\(event.date) at \(event.time)")
                        .padding(.bottom, 10)
                    HStack(alignment: .center)  {
                        Image(systemName: "pin.fill")
                        Text("Location")
                            .font(.headline)
                    }
                    Text(event.location)
                        .padding(.bottom, 10)
                    Text(event.description)
                        .padding(.bottom, 10)
                    HStack(alignment: .center)  {
                        Image(systemName: "sterlingsign.circle.fill")
                        Text(String(format: "£%.2f", event.price))
                            .font(.headline)
                            .padding(.bottom, 10)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "link")
                        Text("More Information")
                            .font(.headline)
                    }
                }
                .font(.body)
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
            .navigationTitle("Event Information")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(event: Event.example, viewModel: ContentViewModel())
    }
}
