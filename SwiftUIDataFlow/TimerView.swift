//
//  TimerView.swift
//  SwiftUIDataFlow
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

struct TimerView: View {

	var body: some View {
		VStack(spacing: 16) {
			Text((Date.now..<Date.now.advanced(by: 60)).formatted(.timeDuration)) // TODO: Take dates form TimeModel
				.font(.largeTitle)
				.padding(44)
				.background(Circle().stroke(Color.orange, lineWidth: 6)) //TODO: Pass circle color
				.padding(.top, 48)
      // TODO: Bind timer value with TimeInterval
      Stepper("Set Timer", value: .constant(TimeInterval(60)), step: 1)
        .padding(24)
		}
	}
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
