# **Air Quality Visualization App**

A simple iOS app built with **Swift** and **SwiftUI** that fetches real-time air quality data and displays an appropriate image based on the AQI (Air Quality Index). This project demonstrates API integration, JSON parsing, and UI updates in an iOS application.

---

## **Tech Stack**

- **Programming Language**: Swift  
- **Framework**: UIKit  
- **Networking**: URLSession  
- **API**: [AirVisual API](https://www.iqair.com/air-quality-api)  
- **User Interface**: Storyboard + UIKit  

---

## **Features**

- **Real-Time Air Quality Fetching**: Retrieves AQI data for Los Angeles, California.  
- **Dynamic Image Updates**: Displays a different emoji based on AQI level.  
- **JSON Parsing**: Extracts relevant pollution data from the API response.  
- **Asynchronous Networking**: Uses URLSession to handle API calls efficiently.  

---

## **How It Works**

### **API Request**
The app makes an API call to fetch air quality data:

```swift
let urlString = "https://api.airvisual.com/v2/city?city=Los%20Angeles&state=California&country=USA&key=YOUR_API_KEY"

guard let url = URL(string: urlString) else {
    print("Incorrect URL")
    return
}

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    guard let responseData = data else {
        print("No data received")
        return
    }

    do {
        if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
            print("Full JSON Response: \(json)")
        }
    } catch {
        print("Error parsing JSON: \(error)")
    }
}
task.resume()
```

### **API Request**
The API response is parsed to extract the AQI (Air Quality Index) and based on the AQI value, the app updates the UI with a corresponding image:  
   - **Good Air Quality (AQI ≤ 50)** → Happy face  
   - **Moderate Air Quality (AQI ≤ 100)** → Neutral face  
   - **Poor Air Quality (AQI > 100)** → Sad face  


## **Setup & Installation**

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/AirQualityApp.git
   ```
2. Open the project in Xcode.  
3. Replace `YOUR_API_KEY` with your [AirVisual API key](https://www.iqair.com/air-quality-api).  
4. Run the app on a simulator or a real device.  

---

## **Key Files**

| **File**               | **Description**                                       |
|------------------------|-------------------------------------------------------|
| `ViewController.swift` | Handles the UI and updates the AQI display.          |
| `NetworkManager.swift` | Manages API requests and JSON parsing.               |
| `AirQualityModel.swift` | Defines the data structure for AQI information.     |

---
