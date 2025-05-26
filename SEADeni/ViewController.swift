//
//  ViewController.swift
//  SEADeni
//
//  Created by Student on 3/13/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!

    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndDisplayAQI()
    }

    func fetchAndDisplayAQI() {
        networkManager.fetchAQI { [weak self] aqi in
            DispatchQueue.main.async {
                guard let self = self, let aqi = aqi else {
                    self?.aqiLabel.text = "Error"
                    self?.emojiLabel.text = "❓"
                    return
                }

                self.aqiLabel.text = "AQI: \(aqi)"
                self.emojiLabel.text = self.emoji(for: aqi)
            }
        }
    }

    //the bitmoji pictures were on my loaner laptop & the images were lost so here are emojis in place for them for the time being --> its the same effect
    func emoji(for aqi: Int) -> String {
        switch aqi {
        case ...50:
            return "😊"
        case 51...100:
            return "😐"
        default:
            return "😷"
        }
    }


}

