//
//  ContentView.swift
//  MyPersonalWorkout Watch App
//
//  Created by Riccardo Giannetto on 19/08/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ScrollView {
      
      VStack {
        Text("My Personal Workout")
          .font(.callout)
          .foregroundColor(.primary)
        
        Image("Icon")
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
          .foregroundStyle(.primary)
          .padding()
        
        Text("This is a watchOS app for tracking workouts.")
          .font(.subheadline)
          .foregroundColor(.secondary)
          .padding(.bottom, 10)
        
        
        Button("Start Workout") {
          // Azione da eseguire quando il pulsante viene premuto
          print("Workout started!")
        }
        .padding()
      }
    }
  }
}

#Preview {
  ContentView()
}
