//
//  HomeViewController.swift
//  Bookquipo
//
//  Created by Elmy on 24/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    var category = ["Thriller","Romance","Adventure","Fantasy"]
    var selectedList = [Books]()
    var bookList = [Books]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeTableView.delegate = self
        homeTableView.dataSource = self
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        return cell
    }
    
}

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedList.removeAll()
        for books in bookList {
            if category[row] == books.category {
                selectedList.append(books)
            }
        }
        homeTableView.reloadData()
    }
    
}
