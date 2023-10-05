//
//  File.swift
//  ScheduleBackgroundTaskTest Watch App
//
//  Created by oshima-katsutoshi on 2023/10/06.
//

import Foundation
import WatchKit


class MyWatchAppDelegate: NSObject, WKApplicationDelegate {
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task in backgroundTasks {
            print("handle backgroundTasks")
            print(task)
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                print("backgroundTask")
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompletedWithSnapshot(true)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                print("snapshotTask")
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                print("connectivityTask")
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(true)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                print("urlSessionTask")
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(true)
            default:
                print("default")
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(true)
            }
        }
        
    }
    func applicationDidEnterBackground() {
        print("Entaer Background")
        let fireDate = Date(timeIntervalSinceNow: 60 * 1)
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { error in
            if let error = error {
                print("Failed to schedule background refresh: \(error.localizedDescription)")
            } else {
                print("Background refresh scheduled!")
            }
        }
    }
    
    private func handleBackgroundRefresh(task: WKRefreshBackgroundTask) {
        // Handle your background refresh logic here
        print("call handleBackgroundRefresh")
        // Then, schedule the next background refresh
        let fireDate = Date(timeIntervalSinceNow: 60 * 1) // 15 minutes from now
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { error in
            if let error = error {
                print("Failed to schedule background refresh: \(error.localizedDescription)")
            } else {
                print("handleBackgroundRefresh refresh scheduled!")
            }
        }
    }
}
