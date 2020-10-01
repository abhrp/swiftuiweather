//
//  WeatherService.swift
//  SwiftUIWeather
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "\(WebServiceConstants.BASE_URL)?q=\(city)&appid=\(APIKeys.API_KEY)&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
