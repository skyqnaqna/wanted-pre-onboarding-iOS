//
//  WeatherData.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/11.
//

import Foundation

struct WeatherData: Codable {
  let name: String
  let weather: [Weather]
  let main: Main
  let wind: Wind
}

struct Weather: Codable {
  let id: Int
  let main: String
  let description: String
  let icon: String
}

struct Main: Codable {
  let temp: Double
  let feels_like: Double
  let temp_min: Double
  let temp_max: Double
  let pressure: Int
  let humidity: Int
}

struct Wind: Codable {
  let speed: Double
  let deg: Int
}
