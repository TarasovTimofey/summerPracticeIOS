//
//  LibraryViewController.swift
//  Second
//
//  Created by Тимофей Тарасов on 02.07.2024.
//

import UIKit

class Book {
    var name: String
    var author: String
    var description: String
    init(name: String, author: String, description: String) {
        self.name = name
        self.author = author
        self.description = description
    }
}

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var bookTable: UITableView!
    
    var dataSource: [Book] = [Book(name: "Лох", author: "Стивен Кинг", description: "Lorem ipsum"), Book(name: "Ебалан", author: "Френсис Скотт Фиджеральд", description: "Lorem ipsum"), Book(name: "Залупа Иваныча", author: "Стивен Кинг", description: "Lorem ipsum")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTable.dataSource = self
        bookTable.delegate = self
        
    
    }

}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = bookTable.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell()}
        
        cell.config(book: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
