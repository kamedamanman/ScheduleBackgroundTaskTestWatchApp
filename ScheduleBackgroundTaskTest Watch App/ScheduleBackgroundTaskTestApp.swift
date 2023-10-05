//
//  ScheduleBackgroundTaskTestApp.swift
//  ScheduleBackgroundTaskTest Watch App
//
//  Created by oshima-katsutoshi on 2023/10/06.
//

import SwiftUI

@main
struct ScheduleBackgroundTaskTest_Watch_AppApp: App {
    @WKApplicationDelegateAdaptor var appDelegate: MyWatchAppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
