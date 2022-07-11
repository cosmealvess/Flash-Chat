//
//  ChatTableViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 11/7/2022.
//

import UIKit
import Firebase

protocol chatTableViewControllerProtocol: AnyObject {
    func logOutButton()
}

class ChatTableViewController: UITableViewController {
    
    var delegate: chatTableViewControllerProtocol?
    
    func delegate(delegate:chatTableViewControllerProtocol?){
        self.delegate = delegate
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hey"),
        Message(sender: "a@2.com", body: "oi"),
        Message(sender: "b@2.com", body: "ai")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Chat Flash"
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
//        let logOutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logOutPressed))
        
        let logOutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logOutPressed(_:)))
        
        logOutButton.tintColor = UIColor(displayP3Red: 255, green: 253, blue: 247, alpha: 1.0)
        
        navigationItem.rightBarButtonItems = [logOutButton]
        
        let myColor = UIColor(displayP3Red: 0/255, green: 203/255, blue: 214/255, alpha: 1.0)
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.backgroundColor = myColor
        navBarAppearence.titleTextAttributes = [.foregroundColor:UIColor(displayP3Red: 255, green: 253, blue: 247, alpha: 1.0)]
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func logOutPressed(_ sender:UIBarButtonItem){
        self.delegate?.logOutButton()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = messages[indexPath.row].body
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChatTableViewController: chatTableViewControllerProtocol {
    func logOutButton() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("Error sigining out: %@", signOutError)
        }
    }
    
    
}
