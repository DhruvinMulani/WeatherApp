//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Grishma Dave on 03/08/23.
//

import UIKit

enum TemperatureUnits {
    case celsius
    case fahrenheit
}

enum WeatherCondition: Int {
    case sunny = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case overCast = 1009
    case mist = 1030
    case patchyRainPossible = 1063
    case patchySnowPossible = 1066
    case patchySleetPossible = 1069
    case patchyFreezingDrizzlePossible = 1072
    case thunderyOutbreaksPossible = 1087
    case blowingSnow = 1114
    case blizzard = 1117
    case fog = 1135
    case freezingFog = 1147
    case patchyLightDrizzle = 1150
    case lightDrizzle = 1153
    case freezingDrizzle = 1168
    case heavyFreezingDrizzle = 1171
    case patchyLightRain = 1180
    case lightRain = 1183
    case moderateRainAtTimes = 1186
    case moderateRain = 1189
    case heavyRainAtTimes = 1192
    case heavyRain = 1195
    case lightFreezingRain = 1198
    case moderateOrheavyRainShower = 1243
    case torrentialRainShower = 1246
    case lightSleetShowers = 1249
    case moderateOrHeavySleetShowers = 1252
    case lightSnowShowers = 1255
    case lightShowersOfIcePellets = 1261
    case moderateOrHeavyShowersOfIcePellets = 1264
    case patchyLightRainWithThunder = 1273
    case moderateOrHeavyRainWithThunder = 1276
    case patchyLightSnowWithThunder = 1279
    case moderateOrHeavySnowWithThunder = 1282
}

extension WeatherCondition {
    var icon: UIImage {
        var colorsConfig: UIImage.SymbolConfiguration!
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold)
        let image: UIImage!
        
        switch self {
        case .sunny:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "sun.max.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .partlyCloudy:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.sun.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .cloudy:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .overCast:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .mist:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.torrential,WAColors.WeatherConditions.torrential])
            image = UIImage(systemName: "cloud.fog.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyRainPossible:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun,WAColors.WeatherConditions.rain])
            image = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchySnowPossible,.lightSnowShowers,.lightShowersOfIcePellets,.moderateOrHeavyShowersOfIcePellets:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.sun.snow.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchySleetPossible:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.sleet.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyFreezingDrizzlePossible:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .thunderyOutbreaksPossible:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.bolt.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .blowingSnow:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.snow.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .blizzard:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.snow.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .fog:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.fog.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .freezingFog:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.fog.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyLightDrizzle:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .lightDrizzle:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .freezingDrizzle:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.snow])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .heavyFreezingDrizzle:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.snow])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyLightRain,.moderateOrheavyRainShower:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun,WAColors.WeatherConditions.rain])
            image = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .lightRain:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .moderateRainAtTimes:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .moderateRain:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .heavyRainAtTimes:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.heavyrain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .heavyRain:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun])
            image = UIImage(systemName: "cloud.heavyrain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .lightFreezingRain:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.drizzle.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .torrentialRainShower:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.torrential,WAColors.WeatherConditions.sun,WAColors.WeatherConditions.rain])
            image = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .lightSleetShowers,.moderateOrHeavySleetShowers:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.rain,WAColors.WeatherConditions.cloud])
            image = UIImage(systemName: "cloud.sleet.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyLightRainWithThunder:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.torrential,WAColors.WeatherConditions.bolt])
            
            image = UIImage(systemName: "cloud.bolt.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .moderateOrHeavyRainWithThunder:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.torrential,WAColors.WeatherConditions.bolt])
            image = UIImage(systemName: "cloud.bolt.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .patchyLightSnowWithThunder:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.sun,WAColors.WeatherConditions.bolt])
            image = UIImage(systemName: "cloud.sun.bolt.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        case .moderateOrHeavySnowWithThunder:
            colorsConfig = UIImage.SymbolConfiguration(paletteColors: [WAColors.WeatherConditions.cloud,WAColors.WeatherConditions.bolt,WAColors.WeatherConditions.snow])
            image = UIImage(systemName: "cloud.bolt.rain.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        }
        return image
    }
}
