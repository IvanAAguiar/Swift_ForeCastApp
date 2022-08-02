//
//  Forecast.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/29/22.
//

import Foundation

// MARK: - Welcome
public struct Welcome: Codable {
    var cod: String
    var message, cnt: Int
    var list: [Day]
    var city: City
}

// MARK: - City
struct City: Codable {
    var id: Int
    var name: String
    var coord: Coord
    var country: String
    var population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    var lat, lon: Double
}

// MARK: - List
struct Day: Codable, Identifiable {
    var id: Int
    var main: Main
    var weather: [Weather]
    var clouds: Clouds
    var wind: Wind
    var visibility, pop: Int
    var sys: Sys
    var dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case id = "dt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    var all: Int
}

// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double
    var pressure, seaLevel, grndLevel, humidity: Int
    var tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}

// MARK: - Weather
struct Weather: Codable, Identifiable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}


    
