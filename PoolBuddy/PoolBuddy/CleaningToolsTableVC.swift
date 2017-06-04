//
//  CleaningToolsTableVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class CleaningToolsTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var maintenanceEquipment: [PoolCategory] = {
        return PoolCategory.maintenanceEquipment()
    }()

    // Outlets for table view screen
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if self.revealViewController() != nil {
//            menuButton.target = self.revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//        self.revealViewController().rearViewRevealWidth = 325
        
        navigationItem.title = "Cleaning Tools"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let poolCategory = maintenanceEquipment[section]
        return poolCategory.group
    }
    
    // Changes header BG color and text color
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Background color
        view.tintColor = UIColor.init(red: 64/255, green: 224/255, blue: 208/255, alpha: 1.0)
        // Text Color
        let header: UITableViewHeaderFooterView = (view as! UITableViewHeaderFooterView)
        header.textLabel!.textColor = UIColor.black
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return maintenanceEquipment.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let poolCategory = maintenanceEquipment[section]
        return poolCategory.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cleaningTools, for: indexPath) as! CleaningToolsTableViewCell
        
        let poolCategory = maintenanceEquipment[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        let poolData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
        cell.configureCell(poolData)
        return cell
    }
    
    
    // MARK: - Navigation
    
    // Passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == toDetailVC {
            let destination = segue.destination as! CleaningToolsDetailVC
            if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell) {
        
                let poolCategory = maintenanceEquipment[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.label = product.label
                destination.image = UIImage(named: product.image)
                destination.label2 = product.label2
                destination.image2 = UIImage(named: product.image2)
                destination.descriptions = product.description
            }
        }
    }
    @IBAction func mainMenuButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
