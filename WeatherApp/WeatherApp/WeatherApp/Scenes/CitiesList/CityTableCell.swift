//
//  CityTableCell.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import UIKit

class CityTableCell: UITableViewCell {

    @IBOutlet private weak var lblCity: UILabel?
    @IBOutlet weak var lblTemp: UILabel?
    @IBOutlet private weak var imgWeatherCondition: UIImageView?
    
    var detailCityData: WeatherModel? {
        didSet {
            lblCity?.text = detailCityData?.location.name ?? ""
            imgWeatherCondition?.image = UIImage(named: "\(detailCityData?.current.condition?.icon ?? "")")
        }
    }
    
}
