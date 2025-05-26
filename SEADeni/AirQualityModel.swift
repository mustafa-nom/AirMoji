import Foundation

struct AirQualityResponse: Codable {
    let data: CityData
}

struct CityData: Codable {
    let current: CurrentData
}

struct CurrentData: Codable {
    let pollution: PollutionData
}

struct PollutionData: Codable {
    let aqius: Int
}
