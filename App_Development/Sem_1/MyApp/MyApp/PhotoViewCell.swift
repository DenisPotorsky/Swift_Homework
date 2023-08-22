//
//  PhotoViewCell.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import UIKit

final class PhotoViewCell: UICollectionViewCell {
    
    
    var tap: ((UIImage) -> Void)?
    private var imageView = UIImageView()
    private var photos: [Photo] = []
    //private let network = NetworkService()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateCell (model: Photo) {
            DispatchQueue.global ().async {
                if let url = URL(string: model.sizes.first?.url ?? ""), let data =
                    try? Data (contentsOf: url)
                {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
    private func setupViews() {
        addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

