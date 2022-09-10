//
//  WeatherCollectionViewCell.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/10.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
  let temperatureSymbol = "℃"
  let humiditySymbol = "%"

  var pressed: ((String) -> ())?
  var townName = ""

  override init(frame: CGRect) {
    super.init(frame: frame)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension WeatherCollectionViewCell {
  func initViews() {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "cardBack"), for: .normal)
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false

    let weatherIcon = UIImageView()
    weatherIcon.image = UIImage(systemName: "sun.min")
    weatherIcon.translatesAutoresizingMaskIntoConstraints = false

    let town = UILabel()
    town.text = "서울"
    townName = town.text!
    town.font = UIFont(name: Const.Fonts.notoBold, size: 18)
    town.translatesAutoresizingMaskIntoConstraints = false

    let temperature = UILabel()
    temperature.text = "기온 :"
    temperature.font = UIFont(name: Const.Fonts.notoMedium, size: 16)
    temperature.translatesAutoresizingMaskIntoConstraints = false

    let temperatureValue = UILabel()
    temperatureValue.text = "?" + temperatureSymbol
    temperatureValue.font = UIFont(name: Const.Fonts.notoMedium, size: 16)
    temperatureValue.translatesAutoresizingMaskIntoConstraints = false

    let horizontal1 = UIStackView(arrangedSubviews: [temperature, temperatureValue])
    horizontal1.axis = .horizontal
    horizontal1.spacing = 2
    horizontal1.distribution = .fillEqually
    horizontal1.alignment = .center
    horizontal1.translatesAutoresizingMaskIntoConstraints = false

    let humidity = UILabel()
    humidity.text = "습도 :"
    humidity.font = UIFont(name: Const.Fonts.notoMedium, size: 16)
    humidity.translatesAutoresizingMaskIntoConstraints = false

    let humidityValue = UILabel()
    humidityValue.text = "?" + humiditySymbol
    humidityValue.font = UIFont(name: Const.Fonts.notoMedium, size: 16)
    humidityValue.translatesAutoresizingMaskIntoConstraints = false

    let horizontal2 = UIStackView(arrangedSubviews: [humidity, humidityValue])
    horizontal2.axis = .horizontal
    horizontal2.distribution = .fillEqually
    horizontal2.alignment = .center
    horizontal2.translatesAutoresizingMaskIntoConstraints = false

    contentView.addSubview(button)
    contentView.addSubview(weatherIcon)
    contentView.addSubview(town)
    contentView.addSubview(horizontal1)
    contentView.addSubview(horizontal2)

    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: contentView.topAnchor),
      button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      weatherIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      weatherIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      weatherIcon.widthAnchor.constraint(equalToConstant: 66),
//      weatherIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 43),
//      weatherIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 43),
      weatherIcon.heightAnchor.constraint(equalTo: weatherIcon.widthAnchor, multiplier: 1),
      town.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 8),
      town.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      horizontal1.topAnchor.constraint(equalTo: town.bottomAnchor, constant: 8),
      horizontal1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
      horizontal1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
      horizontal2.topAnchor.constraint(equalTo: horizontal1.bottomAnchor, constant: 8),
      horizontal2.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
      horizontal2.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
      horizontal2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
  }
}

extension WeatherCollectionViewCell {
  @objc func buttonPressed() {
    print("button pressed")
    pressed!(self.townName)
  }
}
