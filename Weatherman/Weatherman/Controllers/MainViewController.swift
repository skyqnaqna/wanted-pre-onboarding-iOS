//
//  ViewController.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/10.
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!

  var weatherManager = WeatherManager()
  var weatherDatas = [WeatherData]()

  override func viewDidLoad() {
    super.viewDidLoad()

    weatherManager.delegate = self
    weatherManager.fetchWeather()
    collectionView.delegate = self
    collectionView.dataSource = self

    self.navigationItem.title = "Weatherman"

    collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: Const.Cells.cardCell)

  }
}

// MARK: - CollectionView Data Source, Delegate, DelegateFlowLayout
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // FIXME: - 데이터가 19개만 들어오는 현상 고치기
    return weatherDatas.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Cells.cardCell, for: indexPath) as? WeatherCollectionViewCell {

      if weatherDatas.count <= indexPath.row { return cell }

      cell.weatherInfo = weatherDatas[indexPath.row]
      cell.updateViews()

      cell.pressed = { name in
        let nextVC = DetailWeatherViewController()
        nextVC.title = name
        nextVC.weatherInfo = self.weatherDatas[indexPath.row]

        self.navigationItem.backButtonTitle = "Main"
        self.navigationController?.navigationBar.tintColor = .black
//        self.navigationItem.backBarButtonItem?.tintColor = .black

        self.navigationController?.pushViewController(nextVC, animated: true)
      }

      return cell
    }

    return UICollectionViewCell()
  }


  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let width = (collectionView.bounds.width - 54) / 2
    let height = width * 1.2

    return CGSize(width: width, height: height)
  }

}

// MARK: - WeatherManager Delegate
extension MainViewController: WeatherManagerDelegate {

  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData) {
    print(weather.name, weather.weather[0].description)

    weatherDatas.append(weather)
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }

  func didFailWithError(error: Error) {
    print(error)
  }

}

extension UIImageView {
  func imageDownload(imageName: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {

    let url =  URL(string: "https://openweathermap.org/img/wn/" + imageName + "@2x.png")!

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
      else {
        print("Download image fail : \(url)")
        return
      }

      DispatchQueue.main.async() { [weak self] in
        print("Download image success \(url)")

        self?.contentMode = mode
        self?.image = image
      }
    }.resume()
  }
}
