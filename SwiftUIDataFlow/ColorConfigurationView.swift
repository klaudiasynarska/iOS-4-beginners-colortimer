	//
	//  ColorConfigurationView.swift
	//  SwiftUIDataFlow
	//
	//  Created by Rafał Kwiatkowski on 22/11/2021.
	//

import SwiftUI

struct ColorConfigurationView: View {
    
    @Binding var colors: [ConfigItem: Color]
    @Binding var selectedItem: ConfigItem
	
	var body: some View {
		Picker("Pick item to configure", selection: $selectedItem) {
			ForEach(ConfigItem.allCases, id: \.self) { config in
				ColorConfigurationView.ConfigurationRow(
					config: config,
                    value: colors[config] ?? .black
				)
			}
		}
		.pickerStyle(.inline)
	}

	enum ConfigItem: String, CaseIterable {
		case timeText = "Time text"
		case circle = "Circle"
		case backgroundPrimary = "Primary background"
		case backgroundSecondary = "Secondary background"
	}

	private struct ConfigurationRow: View {
		let config: ConfigItem
		let value: Color
		
		var body: some View {
			HStack {
				RoundedRectangle(cornerRadius: 4)
					.fill(value)
					.frame(width: 24, height: 24)
				Text(config.rawValue)
				Spacer()
			}.id(config)
		}
	}
}

struct ColorConfigurationView_Previews: PreviewProvider {
	static var previews: some View {
        ColorConfigurationView(
            colors: .constant([
                ColorConfigurationView.ConfigItem.timeText: Color.red,
                ColorConfigurationView.ConfigItem.circle: Color.red,
                ColorConfigurationView.ConfigItem.backgroundPrimary: Color.red,
                ColorConfigurationView.ConfigItem.backgroundSecondary: Color.red
            ]),
            selectedItem: .constant(.backgroundSecondary)
        )
	}
}
