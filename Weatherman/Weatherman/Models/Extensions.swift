//
//  Extensions.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/14.
//

import UIKit

// MARK: - Double
extension Double {
  // Double to String
  func dtos() -> String {
    return String(format: "%.1f", self)
  }
}

// MARK: - UIImageView
extension UIImageView {
  func setBackground() {
    self.backgroundColor = .white
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize(width: 0, height: 4)
    self.layer.cornerRadius = 8
  }

  func imageDownload(imageName: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {

    let url =  URL(string: "https://openweathermap.org/img/wn/" + imageName + "@2x.png")!

    // 캐시에 저장된 이미지가 있으면 불러오고 없으면 nil 반환
    if let cachedImage = ImageCache.imageCache.object(forKey: url.absoluteString as NSString) {
      DispatchQueue.main.async { [weak self] in
        self?.contentMode = mode
        self?.image = cachedImage
      }
    } else {

      var request = URLRequest(url: url)
      request.httpMethod = "GET"

      URLSession.shared.dataTask(with: request) { data, response, error in
        guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
              let mimeType = response?.mimeType, mimeType.hasPrefix("image"), // image 데이터인지 확인
              let data = data, error == nil,
              let image = UIImage(data: data)
        else {
          print("Download image fail : \(url)")
          return
        }

        DispatchQueue.main.async() { [weak self] in
          print("Download image success \(url)")

          ImageCache.imageCache.setObject(image, forKey: url.absoluteString as NSString)

          self?.contentMode = mode
          self?.image = image
        }
      }.resume()
    }
  }
}

// MARK: - UILabel
extension UILabel {
  func setFont(_ size: CGFloat) {
    self.font = UIFont(name: Const.Fonts.notoBold, size: size)
    self.numberOfLines = 0
    self.textAlignment = .left
  }
}

// MARK: - UIStackView
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
