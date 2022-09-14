//
//  Const.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/10.
//

import Foundation

struct Const {
  struct Cells {
    static let cardCell = "cardCell"
  }

  struct Fonts {
    static let notoBlack = "NotoSansKR-Black"
    static let notoBold = "NotoSansKR-Bold"
    static let notoLight = "NotoSansKR-Light"
    static let notoMedium = "NotoSansKR-Medium"
    static let notoRegular = "NotoSansKR-Regular"
    static let notoThin = "NotoSansKR-Thin"
  }

  struct CityID {
    static let cityIdList = [
      "gongju": 1842616,
      "gwangju": 1841811,
      "gumi": 1842225,
      "gunsan": 1842025,
      "daegu": 1835329,
      "daejeon": 1835224,
      "mokpo": 1841066,
      "busan": 1838519,
      "seosan": 1835895,
      "seoul": 1835847,
      "sokcho": 1836553,
      "suwon": 1835553,
      "suncheon": 1835648,
      "ulsan": 1833742,
      "iksan": 1843491,
      "jeonju": 1845457,
      "jeju City": 1846266,
      "cheonan": 1845759,
      "cheongju-si": 1845604,
      "chuncheon": 1845136
    ]
  }

  struct Symbols {
    static let temp = " ℃"
    static let humidity = " %"
    static let pressure = " hPa"
    static let wind = " m/s"
  }
}
