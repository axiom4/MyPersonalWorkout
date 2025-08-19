//
//  MyPersonalWorkoutApp.swift
//  MyPersonalWorkout Watch App
//
//  Created by Riccardo Giannetto on 19/08/25.
//

import SwiftUI

@main
struct MyPersonalWorkout_Watch_AppApp: App {
  @StateObject private var workoutManager = WorkoutManager()
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(workoutManager)
    }
  }
}
