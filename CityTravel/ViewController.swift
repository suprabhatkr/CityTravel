//
//  ViewController.swift
//  CityTravel
//
//  Created by Suprabhat kumar on 03/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cityTableView: UITableView!
    
    struct Constants {
        static let cell = "CityCell"
    }
    
    var cities: [String] = ["Noida", "London", "Paris", "Huoston", "Moscow", "Rio", "Cairo", "Christchurch", "Copenhegan", "Tokyo"]
    var cityCountry: [String: String] = [
        "Noida":"India",
        "London":"UK",
        "Paris":"France",
        "Huoston":"USA",
        "Moscow":"Russia",
        "Rio":"Brazil",
        "Cairo":"Egypt",
        "Christchurch":"New Zealand",
        "Copenhegan":"Denmark",
        "Tokyo":"Japan"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityTableView?.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cell)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityViewCell = cityTableView.dequeueReusableCell(withIdentifier: Constants.cell, for: indexPath)
        
        var cityCellConfiguration = cityViewCell.defaultContentConfiguration()
        var city = cities[indexPath.row]
        cityCellConfiguration.text = city
        cityCellConfiguration.secondaryText = cityCountry[city]
        cityViewCell.contentConfiguration = cityCellConfiguration
        return cityViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        printContent("Selected cell \(indexPath)")
    }
}
