//
//  WeatherButton.swift
//  weatherApp
//
//  Created by Gautam Yadav on 04/11/23.
//

import SwiftUI

struct WeatherButton : View { 
    var title: String
    var textColor: Color
    var background:Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 24, weight: .black))
            .foregroundColor(textColor)
            .background(background.gradient)
            .cornerRadius(10)
    }
}
