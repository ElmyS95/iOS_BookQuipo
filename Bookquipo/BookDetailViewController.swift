//
//  BookDetailViewController.swift
//  Bookquipo
//
//  Created by mandeep kaur on 25/11/20.
//  Copyright © 2020 mandeep. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var txtViewBook: UITextView!

    var book: Books?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            self.setUpNavBar(book.bookName)
            imageViewBook.image = UIImage(named: book.bookPic)
            txtViewBook.text = book.bookSummary
        }
    }
    
    func setUpNavBar(_ title: String){
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = title
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let bookMoreDetailVC = segue.destination as? BookMoreDetailViewController, let book = book {
               bookMoreDetailVC.book = book
           }
       }
    
    @IBAction func BookmarkButtonAction(_ sender: UIButton) {
        if let books = UserDefaultManager.shared.bookmarkData {
            for data in books {
                if data.bookName == book?.bookName {
                    showToast(message: "This book is already bookmarked.", font: .systemFont(ofSize: 12.0))
                } else {
                    UserDefaultManager.shared.bookmarkData?.append(book!)
                }
            }
        } else {
            UserDefaultManager.shared.bookmarkData = [book!]
        }
    }
}
