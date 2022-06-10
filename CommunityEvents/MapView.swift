//
//  MapView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var events: ContentViewModel
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.483959, longitude: -2.244644),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: events.eventsList) {
            event in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)) {
                NavigationLink(destination: ContentView(event: event, viewModel: ContentViewModel())) {
                    Image(systemName: "pin.fill")
                        .onHover { hover in
                            print(event.title)
                        }
                }
            }
        }
            .navigationTitle("Events Near You")
    }
}
