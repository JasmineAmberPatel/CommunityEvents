//
//  SubmissionsView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct SubmissionsView: View {
    @ObservedObject var eventSubmission: EventSubmission
    
    let event: Event
    let viewModel = submissionsViewModel(event: Event(id: "", title: "", date: "", time: "", location: "", latitude: 0.0, longitude: 0.0, price: 0.0, description: "", link: "", imageUrl: ""), eventSubmission: EventSubmission())
    
    
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Text("Event Submissions")
                    .font(.largeTitle)
                    .bold()
                    .padding(20)
                Text("Please enter the details for your upcoming community event following the examples given below. We ask for the event latitude and longitude to allow us to show your event on our interactive map. If you are unsure about your events latitude and longitude you can enter your event postcode here: https://www.latlong.net/")
                    .font(.caption)
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 10)
            }
            Form {
                Section {
                    HStack {
                        Text("Title:")
                            .font(.headline)
                        TextField(Event.example.title, text: $eventSubmission.title)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Date:")
                            .font(.headline)
                        TextField(Event.example.date, text: $eventSubmission.date)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Time:")
                            .font(.headline)
                        TextField(Event.example.time, text: $eventSubmission.time)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Location:")
                            .font(.headline)
                        TextField(Event.example.location, text: $eventSubmission.location)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Latitude:")
                            .font(.headline)
                        TextField("66.543701", value: $eventSubmission.latitude, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Longitude:")
                            .font(.headline)
                        TextField("25.844311", value: $eventSubmission.longitude, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Price:")
                            .font(.headline)
                        TextField("1.50", value: $eventSubmission.price, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Description")
                            .font(.headline)
                        TextField(Event.example.description, text: $eventSubmission.description)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Link:")
                            .font(.headline)
                        TextField(Event.example.link ?? "www.example.com", text: $eventSubmission.link)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Image Url:")
                            .font(.headline)
                        TextField(Event.example.imageUrl ?? "https://unsplash.com/photos/xSiQBSq", text: $eventSubmission.imageUrl)
                            .foregroundColor(.ceOrange)
                    }
                }
                Section {
                    Button(action: {
                        Task {
                            await viewModel.postEvent()
                        }
                    }) {
                        Text("Submit")
                    }
                }
                .disabled(eventSubmission.disableForm)
                .font(.headline)
                .multilineTextAlignment(.center)
            }
        }
        .navigationBarHidden(true)
    }
    
    struct SubmissionsView_Previews: PreviewProvider {
        static var previews: some View {
            SubmissionsView(eventSubmission: EventSubmission(), event: Event.example)
        }
    }
}
