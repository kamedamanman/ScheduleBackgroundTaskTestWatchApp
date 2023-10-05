//
//  ContentView.swift
//  ScheduleBackgroundTaskTest Watch App
//
//  Created by oshima-katsutoshi on 2023/10/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Schedule Background Task") {
                scheduleBackgroundTask()
            }
        }
        .padding()
    }
    func scheduleBackgroundTask() {
        let fireDate = Date(timeIntervalSinceNow: 60 * 1)
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { error in
            if let error = error {
                print("Failed to schedule background refresh: \(error.localizedDescription)")
            } else {
                print("Background refresh scheduled!")
            }
        }
    }
}

#Preview {
    ContentView()
}
