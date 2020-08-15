//
//  ContactsViewController.swift
//  PruebaElUniversal
//
//  Created by Ago Consultores on 14/08/20.
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let contacts = ContactAPI.getContacts() // model
    let contactsTableView = UITableView() // view
    
    



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        view.addSubview(contactsTableView)
        contactsTableView.backgroundColor = UIColor.white
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self

        
//      contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")


    

        navigationItem.title = "Contacts"
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.backgroundColor = UIColor.white
//      cell.textLabel?.text = contacts[indexPath.row].name
        cell.contact = contacts[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
