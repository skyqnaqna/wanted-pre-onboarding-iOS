//
//  ViewController.swift
//  Weatherman
//
//  Created by Subin Kim on 2022/09/10.
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.delegate = self
    collectionView.dataSource = self

    self.navigationItem.title = "Weatherman"

    collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: Const.Cells.cardCell)
  }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Cells.cardCell, for: indexPath) as? WeatherCollectionViewCell {

      cell.initViews()

      return cell
    }

    return UICollectionViewCell()
  }


  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 13
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let width = (collectionView.bounds.width - 10) / 2
    let height = width * 1.2

    return CGSize(width: width, height: height)
  }
}
