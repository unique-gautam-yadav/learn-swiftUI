//
//  ContentView.swift
//  weatherApp
//
//  Created by Gautam Yadav on 03/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDark: Bool = false 
    
    var body: some View {
        ZStack {
            GradientBackGround(isDark: isDark)
            
            VStack (spacing: 10)
            {
                
                Text("Mathura, UP")
                    .font(.system(size: 40, weight: .heavy,  design: .rounded))
                    .foregroundStyle(.white)
                    .padding()
                
                Image(systemName: isDark ? "moon.stars.fill" : "cloud.sun.fill")    
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .foregroundStyle(.white, .orange, .green)
                    .aspectRatio(contentMode: .fit)
                
                    .frame(width: 180, height: 180)
                
                Text("78°")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
                    .padding(.bottom , 70)
                
                HStack (spacing : 25) {
                    WeatherCard(dayName: "TUE", temp: 78, iconName: "cloud.sun.fill")
                    
                    WeatherCard(dayName: "WED", temp: 68, iconName: "sun.max.fill")
                    
                    WeatherCard(dayName: "THU", temp: 73, iconName: "wind.snow")
                    
                    WeatherCard(dayName: "FRI", temp: 79, iconName: "sunset.fill")
                    
                    WeatherCard(dayName: "SAT", temp: 66, iconName: "snowflake")
                }
                
                Spacer()
                
                Button {
                    isDark.toggle()
                }
            label: {
                WeatherButton(
                    title: "Change Day Time",
                    textColor: .blue,
                    background: .white)
            }
            .padding(.bottom, 65)
                
            }
            
        }
    } 
}

#Preview {
    ContentView()
}

struct WeatherCard: View {
    
    var dayName: String
    var temp: Int
    var iconName: String
    
    
    var body: some View {
        VStack (spacing : 20) {
            Text(dayName)
                .font(.system(size: 22))
                .foregroundStyle(.white)
            Image(systemName: iconName)
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
            Text("\(temp)°")
                .font(.system(size: 34))
                .foregroundStyle(.white)
        }
    }
}

struct GradientBackGround: View {
     
//    @Binding var isDark: Bool  .// Binding is used when we need to change the data from child to parent
    var isDark: Bool // Here we're not change isDark from background so we'll just listen to it not going to bind data from here to Main view
    
    var body: some View {
        ContainerRelativeShape()
            .fill( isDark ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea(.all)
    }
}

 
