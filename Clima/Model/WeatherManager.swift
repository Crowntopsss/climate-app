//
//  weatherManager.swift
//  Clima
//
//  Created by Temitope on 25/03/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=13fa5cf77cd7c968b500de0914842df9&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData =  data{
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
            print(decodedData.main.temp)
            print(decodedData.name)
            print(getConditionName(weatherId: <#T##Int#>))
        }catch {
            print(error)
        }
        
    }
    func getConditionName(weatherId: Int) -> String {
        
    }
}
