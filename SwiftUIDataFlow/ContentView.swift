//
//  ContentView.swift
//  SwiftUIDataFlow
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    
    @State var colors: [ColorConfigurationView.ConfigItem: Color] = [
        .timeText: .black,
        .circle: .pink,
        .backgroundPrimary: .blue,
        .backgroundSecondary: .green,
    ]
    
    @State var selectedItem: ColorConfigurationView.ConfigItem = .timeText
    
    @State private var selectedColor: Color = .white
    @State private var timerViewBackgroundColor: Color = .white

	var body: some View {
		VStack(spacing: 0) {
            TimerView(circleColor: $colors[.circle], timerColor: $colors[.timeText])
                .onReceive(timerModel.$time, perform: { time in
                    withAnimation(.easeInOut) {
                        if time.timeIntervalSince1970.truncatingRemainder(dividingBy: 2) == 0 {
                            timerViewBackgroundColor = colors[.backgroundPrimary] ?? .white
                        } else {
                            timerViewBackgroundColor = colors[.backgroundSecondary] ?? .white
                        }
                    }
                    
                })
                .background(timerViewBackgroundColor.edgesIgnoringSafeArea(.top))

			Form {
				Section("Color configurator") {
					ColorConfigurationView(
                        colors: $colors,
                        selectedItem: $selectedItem
                    )

                    ColorPicker("Pick the color", selection: $selectedColor)
                        .onChange(of: selectedColor, perform: { newValue in
                            colors[selectedItem] = newValue
                        })
						.padding()
				}
				Button("Start the count!") {
                    timerModel.start()
				}
				.buttonStyle(.borderless)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
