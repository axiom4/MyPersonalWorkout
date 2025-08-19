//
//  ContentView.swift
//  MyPersonalWorkout Watch App
//
//  Created by Riccardo Giannetto on 19/08/25.
//

import SwiftUI
import AVFoundation
import AVKit

struct OverlayPlayerForTimeRemove: View {
  var body: some View {
    VideoPlayer(player: nil,videoOverlay: { })
      .focusable(false)
      .disabled(true)
      .opacity(0)
      .allowsHitTesting(false)
      .accessibilityHidden(true)
  }
}

struct ContentView: View {
  
  var dynamicPadding: CGFloat {
    let device = WKInterfaceDevice.current()
    switch device.screenBounds.size {
    case CGSize(width: 205, height: 258): // Apple Watch Ultra 49mm
      return 40
    case CGSize(width: 200, height: 250): // Apple Watch Ultra 46mm
      return 35
    case CGSize(width: 198, height: 242): // Apple Watch Series 7/8/9 45mm
      return 30
    case CGSize(width: 176, height: 205): // Apple Watch Series 4/5/6/SE 44mm
      return 20
    case CGSize(width: 162, height: 197): // Apple Watch Series 3
      return 10
    default:
      return 2
    }
  }
  
  var body: some View {
    
    ScrollView {
      VStack {
        OverlayPlayerForTimeRemove()
          .padding()
        
        Text("My Personal Workout")
          .font(.callout)
          .foregroundColor(.primary)
        
        Image("MyPersonalWorkout")
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
          .foregroundStyle(.primary)
          .padding()
        
        Text("This is a watchOS app for tracking workouts.")
          .font(.subheadline)
          .foregroundColor(.secondary)
          .multilineTextAlignment(TextAlignment.center)
          .padding(.bottom, 40)
        
        Button("Start Workout") {
          // Azione da eseguire quando il pulsante viene premuto
          print("Workout started!")
        }
      }
      .navigationBarBackButtonHidden(true)
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ContentView()
}
