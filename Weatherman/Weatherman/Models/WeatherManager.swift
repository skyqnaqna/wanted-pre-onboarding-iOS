//
//  WeatherManager.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/11.
//

import Foundation

protocol WeatherManagerDelegate {
  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData)
  func didFailWithError(error: Error)
}

struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
  let apiKey = "&appid=069ec4c22e7b49693ba43f753eb1738a#"

  var delegate: WeatherManagerDelegate?

  func fetchWeather() {
    for cityId in Const.CityID.cityIdList.values {
      let url = weatherURL + "&id=\(cityId)" + apiKey

      self.performRequest(with: url)
    }
  }

  func performRequest(with urlString: String) {

    if let url = URL(string: urlString) {

      // Create a URLSession
      let session = URLSession(configuration: .default)

      let task = session.dataTask(with: url) { data, response, error in
        if error != nil {
          self.delegate?.didFailWithError(error: error!)
          return
        }

        if let safeData = data {
          if let weather = self.parseJSON(safeData) {
          self.delegate?.didUpdateWeather(self, weather: weather)
          }
        }
      }

      task.resume()
    }
  }

  func parseJSON(_ safeData: Data) -> WeatherData? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(WeatherData.self, from: safeData)

      return decodedData

    } catch {
      self.delegate?.didFailWithError(error: error)
      return nil
    }
  }
}
