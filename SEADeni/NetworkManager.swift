import Foundation

class NetworkManager {
    private let apiKey = "api_key" //replace w/ your actual API key

    func fetchAQI(for city: String = "Los Angeles", completion: @escaping (Int?) -> Void) {
        let baseURL = "https://api.airvisual.com/v2/city"
        let urlString = "\(baseURL)?city=\(city)&state=California&country=USA&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("API call failed:", error ?? "Unknown error")
                completion(nil)
                return
            }

            do {
                let decoded = try JSONDecoder().decode(AirQualityResponse.self, from: data)
                let aqi = decoded.data.current.pollution.aqius
                completion(aqi)
            } catch {
                print("JSON Parsing Error:", error)
                completion(nil)
            }
        }.resume()
    }
}
