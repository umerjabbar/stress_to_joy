//
//  ProritiesViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class ProritiesViewController: BaseViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [(String, [String])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.startLoading()
        Database.database().reference().child("priorities_of_the_day").child(AppStateManager.shared.id).observe(.value) { (snapshot) in
            self.stopLoading()
            if let dict = snapshot.value as? [String:Any] {
                self.items = dict.map({ (key,value) -> (String, [String]) in
                    if let val = value as? [String:String]{
                        let array = val.map({ (key2, value2) -> String in
                            return value2
                        })
                        return (key, array)
                    }
                    return (key, [])
                })
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ProritiesViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        
//        if let label = cell.viewWithTag(10) as? UILabel {
//            label.text = "\(indexPath.row + 1)"
//        }
        
        if let label = cell.viewWithTag(11) as? UILabel {
            label.text = self.items[indexPath.section].1[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.items[section].0
    }
    
}

extension ProritiesViewController : UITableViewDelegate {
    
}
