//
//  TableViewCell.swift
//  Second
//
//  Created by Тимофей Тарасов on 03.07.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        likeButton.setImage(UIImage?(.likedIcon), for: UIControl.State.normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        authorLabel.text = nil
        
    }
    func config(book: Book) {
        nameLabel.text = book.name
        authorLabel.text = book.author
    }

}
