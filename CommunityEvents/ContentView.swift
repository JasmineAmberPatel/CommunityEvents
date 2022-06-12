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
                .frame(width: 360, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Group {
                    Text(event.title)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)
                    Divider()
                    HStack(alignment: .center)  {
                        Image(systemName: "calendar")
                            .foregroundColor(.ceOrange)
                        Text("Date and Time")
                            .font(.headline)
                    }
                    Text("\(event.date) at \(event.time)")
                        .padding(.bottom, 10)
                    HStack(alignment: .center)  {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.ceOrange)
                        Text("Location")
                            .font(.headline)
                    }
                    Text(event.location)
                        .padding(.bottom, 10)
                    Divider()
                    Text(event.description)
                        .padding(.bottom, 10)
                    HStack(alignment: .center)  {
                        Image(systemName: "sterlingsign.circle.fill")
                            .foregroundColor(.ceOrange)
                            .padding(.bottom, 10)
                        Text(String(format: "£%.2f", event.price))
                            .font(.headline)
                            .padding(.bottom, 10)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "link")
                            .foregroundColor(.ceOrange)
                        Link("More information", destination: URL(string: event.link ?? "no link available")!)
                            .font(.headline)
                    }
                }
                .font(.body)
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(event: Event.example, viewModel: ContentViewModel())
    }
}
