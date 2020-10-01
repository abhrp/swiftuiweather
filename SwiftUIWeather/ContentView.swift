//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Abhiroop Patel on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city name", text: self.$weatherViewModel.city, onCommit:  {
                self.weatherViewModel.search()
            }).font(.custom("Aria", size: 30))
            .padding()
            .foregroundColor(Color.black)
                
            Text(self.weatherViewModel.temperature)
                .font(.custom("Aria", size: 40))
                .padding()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
