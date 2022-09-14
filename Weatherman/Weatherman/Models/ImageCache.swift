//
//  ImageCache.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/14.
//

import UIKit

class ImageCache {
  // NSString은 캐싱에 사용될 키
  static let imageCache = NSCache<NSString, UIImage>()
}
