//
//  TimerView.swift
//  SwiftUIDataFlow
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

struct TimerView: View {

    @EnvironmentObject var timerModel: TimerModel
    
    @Binding var circleColor: Color?
    @Binding var timerColor: Color?

	var body: some View {
		VStack(spacing: 16) {
            Text((timerModel.referenceTime..<timerModel.time).formatted(.timeDuration))
				.font(.largeTitle)
                .foregroundColor(timerColor)
				.padding(44)
                .background(Circle().stroke(circleColor ?? .white, lineWidth: 6))
				.padding(.top, 48)
            
            Stepper(
                "Set Timer",
                value: Binding<TimeInterval>(
                    get: {
                        timerModel.time.timeIntervalSince1970
                    }, set: { value in
                        guard value >= 0 else { return }
                        timerModel.time = Date(timeIntervalSince1970: value)
                    }
                ),
                step: TimeInterval(1)
            ).padding(24)
		}
	}
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(circleColor: .constant(.red), timerColor: .constant(.blue))
    }
}
