//
//  PhotoViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//
import UIKit
class PhotoViewController: UICollectionViewController {
    
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Photos"
        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: "Cell")
        networkService.getPhotos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let cell = cell as? PhotoViewCell else {
            return UICollectionViewCell()
        }
        cell.tap = { [weak self] image in
            self?.navigationController?.pushViewController(ViewController(), animated: true)
        }
        return cell
    }
}

extension PhotoViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
}
