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
        fillData()
        homeTableView.tableFooterView = UIView()
        for books in bookList {
            if books.category == category[0] {
                selectedList.append(books)
            }
        }
    }
    
    func fillData() {
        bookList.append(Books(category: "Thriller", name: "Silent Patient", author: "Alex Michaelides", summary: "The Silent Patient is a 2019 psychological thriller novel written by British-Cypriot author Alex Michaelides. The debut novel was published by Celadon Books, a division of Macmillan Publishers, on 5th February 2019. The audiobook version, released on the same date, is read by Louise Brealey and Jack Hawkins.", details: "A gruesome murder, a woman held captive in her own mind, and a therapist determined to unlock her secrets - what’s not to love about Alex Michaelides’ THE SILENT PATIENT? This sophisticated debut suspense novel is every bit deserving of the effusive early praise it’s already receiving. Reading more like a character study than a psychological thriller, THE SILENT PATIENT is a maze-like exploration of the psyches of both a woman convicted of murdering her husband and the therapist determined to treat her. The impactfulness of Michaelides’ exceptional first novel lies not in mile-a-minute pacing or whiplash-inducing twists, but in the author’s masterful, methodical building - and breaking down - of his characters. Just as his protagonist explores and unveils the mental state of his subject, so, too, does Michaelides methodically reveal to his readers the psychology of the characters upon which THE SILENT PATIENT is built. Rather than investigating a crime, THE SILENT PATIENT investigates the mind of a criminal - and what a gripping investigation it is. THE SILENT PATIENT is immersive and hypnotic—the kind of confidently drawn suspense story that doesn’t need big, flashy twists to keep you hooked… but that delivers an exceptional twist or two anyway. Believe the hype: THE SILENT PATIENT may well be the debut crime novel of the season.", price: 10.40, pic: "silent"))
        bookList.append(Books(category: "Thriller", name: "Gone Girl", author: "Gillian Flynn", summary: "Gone Girl is a thriller novel in the mystery and crime genres, by the American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel became quite popular and soon made the New York Times Best Seller list.", details: "Gone Girl is a thriller novel in the mystery and crime genres, by the American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel became quite popular and soon made the New York Times Best Seller list. The sense of suspense in the novel comes from whether or not Nick Dunne is involved in the disappearance of his wife Amy. In several interviews, Flynn has said that she was inspired to write the novel by the disappearance of Californian Laci Peterson in late 2002.[1] Portraying her principal characters as out-of-work writers, she made use of her own experience being laid off from her job as a writer for Entertainment Weekly. Critics in the United States positively received and reviewed the novel. Reviewers praised the novel's use of unreliable narration, plot twists, and suspense. A film adaptation was released on October 3, 2014, directed by David Fincher, and written by Flynn herself, with Ben Affleck and Rosamund Pike starring in lead roles. The film was met with both commercial success and widespread critical acclaim.", price: 4.30, pic: "gonegirl"))
        bookList.append(Books(category: "Thriller", name: "The Girl on the Train", author: "Paula Hawkins", summary: "The Girl on the Train is a 2015 psychological thriller novel by British author Paula Hawkins that gives narratives from three different women about relationship troubles and binge drinking.", details: "Rachel catches the same commuter train every morning. She knows it will wait at the same signal each time, overlooking a row of back gardens. She’s even started to feel like she knows the people who live in one of the houses. “Jess and Jason,” she calls them. Their life—as she sees it—is perfect. If only Rachel could be that happy. And then she sees something shocking. It’s only a minute until the train moves on, but it’s enough. Now everything’s changed. Now Rachel has a chance to become a part of the lives she’s only watched from afar. Now they’ll see; she’s much more than just the girl on the train.", price: 3.8, pic: "girltrain"))
        bookList.append(Books(category: "Thriller", name: "Behind Closed Doors", author: "B. A. Paris", summary: "Everyone knows a couple like Jack and Grace. He has looks and wealth; she has charm and elegance. He's a dedicated attorney who has never lost a case; she is a flawless homemaker, a masterful gardener and cook, and dotes on her disabled younger sister. Though they are still newlyweds, they seem to have it all. You might not want to like them, but you do. You're hopelessly charmed by the ease and comfort of their home, by the graciousness of the dinner parties they throw. You'd like to get to know Grace better ... But it's difficult, because you realize Jack and Grace are inseparable ... Some might call this true love. Others might wonder why Grace never answers the phone. Or why she can never meet for coffee, even though she doesn't work. How she can cook such elaborate meals but remain so slim. Or why she never seems to take anything with her when she leaves the house, not even a pen. Or why there are such high-security metal shutters on all the downstairs windows ... Some might wonder what's really going on once the dinner party is over, and the front door has closed", details: "Kill him. And get away with it. That is the solution achieved by Grace Angel, wife of Jack Angel, a brilliant lawyer who as a boy battered his parents to death and is now torturing his wife, killing her dog and planning the murder of her sister. “Behind Closed Doors” is a thriller in which you will be on the side of the murderer and worried that she may not get away with it. The plot is basic. Most people know a perfect couple and most people may know a couple who are perhaps too perfect. In the case of the Angels, husband Jack is a perfect host in social terms and apparently devoted to his pretty wife Grace. He is sympathetic to her problems with her sister Millie who has Down syndrome. He buys the family a lovable dog called Molly. In his legal work, he defends battered women.He also has built a room an the basement that can only be opened from the outside. It is a room without ventilation so that once you are locked in, you will be there until you die, and you will have nothing to eat or drink or even air to breathe. The room’s walls and floor are painted red and hanging on its red walls are paintings of tortured women. Grace is the painter and she paints at her husband’s command. When she disobeys him, he starves her. He equips the windows of their beautiful home with electronically operated bars. He makes sure the dog dies of asphysixiation in the red room, forces Grace to bury its corpse. and describes to her how he will murder her sister in the room of death.", price: 9.84, pic: "behind"))
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setBookCell(book: selectedList[indexPath.row])
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
