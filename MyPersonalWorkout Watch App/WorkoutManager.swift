//
//  WorkoutManager.swift
//  MyPersonalWorkout
//
//  Created by Riccardo Giannetto on 19/08/25.
//

import Foundation
import HealthKit

@MainActor
class WorkoutManager: ObservableObject {
  @Published var workouts: [String] = []
  
  var sessionRunning: Bool = false
  var sessionStartTime: Date? = nil
  private var healthStore = HKHealthStore()
  private let supportedWorkoutTypes: Set<HKWorkoutActivityType> = [
    .walking,
    .running
  ]
  private let typesToShare: Set<HKSampleType> = [
    HKQuantityType.workoutType(),
    HKQuantityType(.stepCount),
  ]
  
  private let typesToRead: Set<HKObjectType> = [
    HKQuantityType(.heartRate),
    HKQuantityType(.activeEnergyBurned),
    HKQuantityType(.appleWalkingSteadiness),
    HKQuantityType(.appleExerciseTime),
    HKQuantityType(.heartRateRecoveryOneMinute),
    HKQuantityType(.oxygenSaturation),
    HKQuantityType(.respiratoryRate),
    HKQuantityType(.runningPower),
    HKQuantityType(.walkingHeartRateAverage),
    HKQuantityType(.walkingStepLength),
    HKQuantityType(.walkingAsymmetryPercentage),
    HKQuantityType(.walkingDoubleSupportPercentage),
    HKQuantityType(.vo2Max),
    
    HKQuantityType(.stepCount),
    HKQuantityType(.walkingSpeed),
    HKQuantityType(.runningSpeed),
    
    HKQuantityType(.distanceWalkingRunning),
    
    HKObjectType.activitySummaryType()
  ]
  
  
  @Published var isAuthorized = false
  
  init() {
    requestAuthorization()
  }
  
  private func requestAuthorization() {
    healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
      DispatchQueue.main.async {
        self.isAuthorized = success
        if let error = error {
          print("Authorization failed with error: \(error.localizedDescription)")
        }
      }
    }
  }
}




