//
//  PhotoViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//
import UIKit
class PhotoViewController: UICollectionViewController {
    
    private let networkService = NetworkService()
    private var models: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Photos"

        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: "PhotoViewCell")
                networkService.getPhotos { [weak self] photos in
                    self?.models = photos
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    override func collectionView(_ collectionView:
           UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView
               .dequeueReusableCell(withReuseIdentifier:
               "PhotoViewCell", for:
                                       indexPath) as? PhotoViewCell else {
               return UICollectionViewCell()
           }
           let model = models[indexPath.row]
           cell.updateCell(model: model)
           return cell
       }
}

extension PhotoViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}
