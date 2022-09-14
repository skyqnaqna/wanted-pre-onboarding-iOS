//
//  DetailWeatherViewController.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/10.
//

import UIKit

class DetailWeatherViewController: UIViewController {

  var weatherInfo: WeatherData?
  var weatherIcon = UIImageView(),
      temp = UILabel(),
      feelTemp = UILabel(),
      humidity = UILabel(),
      minTemp = UILabel(),
      maxTemp = UILabel(),
      pressure = UILabel(),
      wind = UILabel(),
      weatherDescription = UILabel()


  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    initViews()
    print("This is DetailVC")
  }
}

extension DetailWeatherViewController {

  func initViews() {

    weatherIcon.imageDownload(imageName: weatherInfo!.weather[0].icon)
    weatherIcon.setBackground()
    weatherIcon.translatesAutoresizingMaskIntoConstraints = false

    temp.setFont(20)
    temp.text = weatherInfo!.main.temp.dtos() + Const.Symbols.temp
    temp.translatesAutoresizingMaskIntoConstraints = false

    let tempHead = UILabel()
    tempHead.text = "현재 기온"
    tempHead.setFont(17)
    tempHead.translatesAutoresizingMaskIntoConstraints = false

    let vertical1 = UIStackView(arrangedSubviews: [tempHead, temp])
    vertical1.axis = .vertical
    vertical1.setBackground()
    vertical1.distribution = .fillEqually
    vertical1.alignment = .center
    vertical1.translatesAutoresizingMaskIntoConstraints = false

    feelTemp.setFont(20)
    feelTemp.text = weatherInfo!.main.feels_like.dtos() + Const.Symbols.temp
    feelTemp.translatesAutoresizingMaskIntoConstraints = false

    let feelTempHead = UILabel()
    feelTempHead.text = "체감 기온"
    feelTempHead.setFont(17)
    feelTempHead.translatesAutoresizingMaskIntoConstraints = false

    let vertical2 = UIStackView(arrangedSubviews: [feelTempHead, feelTemp])
    vertical2.axis = .vertical
    vertical2.setBackground()
    vertical2.distribution = .fillEqually
    vertical2.alignment = .center
    vertical2.translatesAutoresizingMaskIntoConstraints = false

    let horizontal = UIStackView(arrangedSubviews: [weatherIcon, vertical1, vertical2])
    horizontal.axis = .horizontal
    horizontal.distribution = .fillEqually
    horizontal.alignment = .fill
    horizontal.spacing = 6
    horizontal.translatesAutoresizingMaskIntoConstraints = false

    humidity.setFont(17)
    humidity.text = String(weatherInfo!.main.humidity) + Const.Symbols.humidity
    humidity.translatesAutoresizingMaskIntoConstraints = false

    let humidityHead = UILabel()
    humidityHead.text = "습도"
    humidityHead.setFont(17)
    humidityHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal1 = UIStackView(arrangedSubviews: [humidityHead, humidity])
    horizontal1.axis = .horizontal
    horizontal1.setBackground()
    horizontal1.setMargins()
    horizontal1.distribution = .fillEqually
    horizontal1.alignment = .fill
    horizontal1.translatesAutoresizingMaskIntoConstraints = false

    minTemp.setFont(17)
    minTemp.text = weatherInfo!.main.temp_min.dtos() + Const.Symbols.temp
    minTemp.translatesAutoresizingMaskIntoConstraints = false

    let minTempHead = UILabel()
    minTempHead.setFont(17)
    minTempHead.text = "최저 기온"
    minTempHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal2 = UIStackView(arrangedSubviews: [minTempHead, minTemp])
    horizontal2.axis = .horizontal
    horizontal2.setBackground()
    horizontal2.setMargins()
    horizontal2.distribution = .fillEqually
    horizontal2.alignment = .fill
    horizontal2.translatesAutoresizingMaskIntoConstraints = false

    maxTemp.setFont(17)
    maxTemp.text = weatherInfo!.main.temp_max.dtos() + Const.Symbols.temp
    maxTemp.translatesAutoresizingMaskIntoConstraints = false

    let maxTempHead = UILabel()
    maxTempHead.setFont(17)
    maxTempHead.text = "최고 기온"
    maxTempHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal3 = UIStackView(arrangedSubviews: [maxTempHead, maxTemp])
    horizontal3.axis = .horizontal
    horizontal3.setBackground()
    horizontal3.setMargins()
    horizontal3.distribution = .fillEqually
    horizontal3.alignment = .fill
    horizontal3.translatesAutoresizingMaskIntoConstraints = false

    pressure.setFont(17)
    pressure.text = String(weatherInfo!.main.pressure) + Const.Symbols.pressure
    pressure.translatesAutoresizingMaskIntoConstraints = false

    let pressureHead = UILabel()
    pressureHead.setFont(17)
    pressureHead.text = "기압"
    pressureHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal4 = UIStackView(arrangedSubviews: [pressureHead, pressure])
    horizontal4.axis = .horizontal
    horizontal4.setBackground()
    horizontal4.setMargins()
    horizontal4.distribution = .fillEqually
    horizontal4.alignment = .fill
    horizontal4.translatesAutoresizingMaskIntoConstraints = false

    wind.setFont(17)
    wind.text = weatherInfo!.wind.speed.dtos() + Const.Symbols.wind
    wind.translatesAutoresizingMaskIntoConstraints = false

    let windHead = UILabel()
    windHead.setFont(17)
    windHead.text = "풍속"
    windHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal5 = UIStackView(arrangedSubviews: [windHead, wind])
    horizontal5.axis = .horizontal
    horizontal5.setBackground()
    horizontal5.setMargins()
    horizontal5.distribution = .fillEqually
    horizontal5.alignment = .fill
    horizontal5.translatesAutoresizingMaskIntoConstraints = false

    weatherDescription.setFont(15)
    weatherDescription.text = weatherInfo!.weather[0].description
    weatherDescription.sizeToFit()
    weatherDescription.translatesAutoresizingMaskIntoConstraints = false

    let weatherDescriptionHead = UILabel()
    weatherDescriptionHead.setFont(17)
    weatherDescriptionHead.text = "날씨 설명"
    weatherDescriptionHead.translatesAutoresizingMaskIntoConstraints = false

    let horizontal6 = UIStackView(arrangedSubviews: [weatherDescriptionHead, weatherDescription])
    horizontal6.axis = .horizontal
    horizontal6.setBackground()
    horizontal6.setMargins()
    horizontal6.distribution = .fillEqually
    horizontal6.alignment = .fill
    horizontal6.translatesAutoresizingMaskIntoConstraints = false

    let vertical = UIStackView(arrangedSubviews: [horizontal1, horizontal2, horizontal3, horizontal4, horizontal5, horizontal6])
    vertical.axis = .vertical
    vertical.distribution = .fillEqually
    vertical.spacing = 6
    vertical.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(horizontal)
    view.addSubview(vertical)

    NSLayoutConstraint.activate([
      weatherIcon.widthAnchor.constraint(greaterThanOrEqualToConstant: 129),
      weatherIcon.heightAnchor.constraint(equalTo: weatherIcon.widthAnchor, multiplier: 1),
      horizontal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      horizontal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      horizontal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      vertical.topAnchor.constraint(equalTo: horizontal.bottomAnchor, constant: 10),
      vertical.leadingAnchor.constraint(equalTo: horizontal.leadingAnchor),
      vertical.trailingAnchor.constraint(equalTo: horizontal.trailingAnchor),
      vertical.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
    ])
  }
}

extension UILabel {
  func setFont(_ size: CGFloat) {
    self.font = UIFont(name: Const.Fonts.notoBold, size: size)
    self.numberOfLines = 0
    self.textAlignment = .left
  }
}

extension UIStackView {
  func setMargins() {
    self.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    self.isLayoutMarginsRelativeArrangement = true
  }

  func setBackground () {
    self.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize(width: 0, height: 4)
    self.layer.cornerRadius = 8
  }
}

extension UIImageView {
  func setBackground() {
    self.backgroundColor = .white
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize(width: 0, height: 4)
    self.layer.cornerRadius = 8
  }
}
