//
//  FavoriteViewController.swift
//  Second
//
//  Created by Тимофей Тарасов on 02.07.2024.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteCollection: UICollectionView!
    
    var dataSource: [Book] = [Book(name: "Лох", author: "Стивен Кинг", description: "Lorem ipsum"), Book(name: "Ебалан", author: "Френсис Скотт Фиджеральд", description: "Lorem ipsum"), Book(name: "Залупа Иваныча", author: "Стивен Кинг", description: "Lorem ipsum")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollection.dataSource = self
        favoriteCollection.delegate = self
    }
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
