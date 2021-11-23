//
//  ContentView.swift
//  SwiftUIDataFlow
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		VStack(spacing: 0) {
			TimerView() // TODO: Configure textColor
        .background(Color.white.edgesIgnoringSafeArea(.top)) // TODO: Change color form primary to secendary on every second passed
			Form {
				Section("Color configurator") {
						// TODO: Pass data to it
					ColorConfigurationView()
					
					ColorPicker("Pick the color", selection: .constant(.red))
						.padding()
				}
				Button("Start the count!") {
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
