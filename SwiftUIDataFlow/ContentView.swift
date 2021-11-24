//
//  ContentView.swift
//  SwiftUIDataFlow
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    private static let defaultColor: Color = .gray
    
    @EnvironmentObject var timerModel: TimerModel
    
//    @State var timeTextColor: Color = ContentView.defaultColor
//    @State var circleColor: Color = ContentView.defaultColor
//    @State var backgroundPrimaryColor: Color = ContentView.defaultColor
//    @State var backgroundSecondaryColor: Color = ContentView.defaultColor
    
    @State var colors: [ColorConfigurationView.ConfigItem: Color] = [
        .timeText: ContentView.defaultColor,
        .circle: ContentView.defaultColor,
        .backgroundPrimary: ContentView.defaultColor,
        .backgroundSecondary: ContentView.defaultColor,
    ]
    
    @State var selectedItem: ColorConfigurationView.ConfigItem = ColorConfigurationView.ConfigItem.timeText
    
    @State private var selectedColor = ContentView.defaultColor

	var body: some View {
		VStack(spacing: 0) {
			TimerView() // TODO: Configure textColor
                .background(Color.white.edgesIgnoringSafeArea(.top))
            // TODO: Change color form primary to secendary on every second passed
			Form {
				Section("Color configurator") {
						// TODO: Pass data to
                    
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
                    // TODO: Start the count here
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
