//
//  BookmarkViewController.swift
//  Bookquipo
//
//  Created by Nency Shobhashana on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    var bookList = [Books]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.intialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.fillData()
        homeTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookDetailVC = segue.destination as? BookDetailViewController, let book = sender as? Books {
            bookDetailVC.book = book
        }
    }
}

extension BookmarkViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkTableViewCell", for: indexPath) as! BookmarkTableViewCell
        cell.setBookCell(book: bookList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookList[indexPath.row]
        self.performSegue(withIdentifier: "BookmarkToDetailView", sender: book)
    }
}

extension BookmarkViewController {
    
    func intialSetup()  {
         homeTableView.delegate = self
         homeTableView.dataSource = self
         fillData()
         homeTableView.tableFooterView = UIView()
    }
    func fillData() {
        bookList = UserDefaultManager.shared.bookmarkData ?? []
    }
}
