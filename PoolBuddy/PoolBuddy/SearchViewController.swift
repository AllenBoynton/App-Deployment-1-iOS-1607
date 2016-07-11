//
//  SearchViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    // Stored properties passed in from class Datasource
    var searchItems: [SearchItems] = []
    var filteredSearch: [SearchItems] = []
    let dataSource = DataSource()
    
    // Outlet for the display of collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Outlet connection to the search bar
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Outlet connection to the menu button
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    // Outlet connection to the nav bar title
    @IBOutlet weak var galleryTitle: UINavigationItem!
    
    
    // Stored properties
    var screenTitle: String = ""
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: photo)
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        galleryTitle!.title = screenTitle
        
        navigationItem.title = "Pool Problems Gallery Search"
        
        // MARK: TableViewDataSource
        
        // Custom object array
        searchItems = [
            SearchItems(imageName: "Green Algae", group: "Algae"),
            SearchItems(imageName: "Mustard Yellow Algae", group: "Algae"),
            SearchItems(imageName: "Black Algae", group: "Algae"),
            SearchItems(imageName: "Red Brown Metal Rust Stains", group: "Metal"),
            SearchItems(imageName: "Blue Green Black Copper Stains", group: "Metal"),
            SearchItems(imageName: "Rusty Brown Green-Brown Iron Stains", group: "Metal"),
            SearchItems(imageName: "Brownish-Black Purple Manganese Stains", group: "Metal"),
            SearchItems(imageName: "Organic Brown Green Stains", group: "Organic"),
            SearchItems(imageName: "Red Blue Berry Seed Stains", group: "Organic"),
            SearchItems(imageName: "Light Covered Surface Debris", group: "Organic"),
            SearchItems(imageName: "Extremely Dirty Pool with Stains", group: "Other"),
            SearchItems(imageName: "Identifying Stains", group: "Other")
        ]
        
        // Configure to recieve updates
        searchController.searchResultsUpdater = self
        
        // SearchController setup
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        // SearchBar setup
        searchController.searchBar.scopeButtonTitles = ["Pools with Colored Algae", "Pools with Metal Stains", "Pools with Organic Stains", "Other Discoloration or Problems"]
        searchController.searchBar.delegate = self
        
        self.definesPresentationContext = true
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearch = searchItems.filter { searchItem in
            let categoryMatch = (scope == "All") || (searchItem.group == scope)
            return categoryMatch && searchItem.imageName.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource


    // MARK: Collection View
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.active || searchController.searchBar.text != "" {
            return filteredSearch.count
        }
        return searchItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photo, forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        let searchItem: SearchItems
        if searchController.active && searchController.searchBar.text != "" {
            searchItem = filteredSearch[indexPath.row]
        } else {
            searchItem = searchItems[indexPath.row]
        }
        cell.galleryImages!.image = UIImage(named: searchItem.imageName)
        
        return cell
    }
    
    // MARK: Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeader, forIndexPath: indexPath) as! HeaderReusableView
        
        // Sourcing data from datasource within dogsingroup to isolate the group protocol
        let pools: [SearchItems] = dataSource.poolsInGroup(indexPath.section)
        let pool = pools[indexPath.row]
        
        let group = pool.group
        
        // Displays group protocol to header view label
        headerView.sectionTitle.text = group
        
        return headerView
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        // Clear any search criteria
        searchBar.text = ""
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    // MARK: Segue to details
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == gallerySegue {
            if let indexPath = collectionView.indexPathForCell(sender as! UICollectionViewCell) {
                let searchItem: SearchItems
                if searchController.active && searchController.searchBar.text != "" {
                    searchItem = filteredSearch[indexPath.row]
                } else {
                    searchItem = searchItems[indexPath.row]
                }
                let controller = segue.destinationViewController as! GalleryDetailVC
                controller.poolDetail = searchItem
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        
    }
}
