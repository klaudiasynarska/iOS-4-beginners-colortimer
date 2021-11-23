	//
	//  ColorConfigurationView.swift
	//  SwiftUIDataFlow
	//
	//  Created by Rafał Kwiatkowski on 22/11/2021.
	//

import SwiftUI

struct ColorConfigurationView: View {
	
	var body: some View {
		Picker("Pick item to configure", selection: .constant(ConfigItem.timeText)) { // TODO: pass selection state
			ForEach(ConfigItem.allCases, id: \.self) { config in
				ColorConfigurationView.ConfigurationRow(
					config: config,
					value: .gray // TODO: Pass this data
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
		ColorConfigurationView()
	}
}
