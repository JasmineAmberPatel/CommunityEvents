//
//  MapView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var events: Events
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.483959, longitude: -2.244644),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: events.eventsList) {
            event in MapAnnotation(coordinate: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(event.latitude),
                longitude: CLLocationDegrees(event.longitude))) {
                    NavigationLink(destination: ContentView(network: Network(), event: event)) {
                        Image(systemName: "pin.fill")
                    }
                }
        }
            .navigationTitle("Events")
    }
}
