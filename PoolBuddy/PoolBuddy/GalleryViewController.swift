//
//  GalleryViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UICollectionViewDelegate, UIScrollViewDelegate {
    
    // Stored properties passed in from class Datasource
    var searchItems: [SearchItems] = []
    var filteredSearch: [SearchItems] = []
    let dataSource = DataSource()
    
    var isDataFiltered: Bool = false
    
    // Outlet for the display of collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        // Custom object array
        searchItems = [
            SearchItems(imageName: "Green Algae", group: "Pools with Algae Problems"),
            SearchItems(imageName: "Mustard Yellow Algae", group: "Pools with Algae Problems"),
            SearchItems(imageName: "Black Algae", group: "Pools with Algae Problems"),
            SearchItems(imageName: "Metal Rust Stains", group: "Pools with Metal Problems"),
            SearchItems(imageName: "Copper Metal Stains", group: "Pools with Metal Problems"),
            SearchItems(imageName: "Iron Metal Stains", group: "Pools with Metal Problems"),
            SearchItems(imageName: "Manganese Metal Stains", group: "Pools with Metal Problems"),
            SearchItems(imageName: "Oily Water Line", group: "Pools with Organic Stains"),
            SearchItems(imageName: "Organic Stains", group: "Pools with Organic Stains"),
            SearchItems(imageName: "Organic Berry Stains", group: "Pools with Organic Stains"),
            SearchItems(imageName: "Surface Debris", group: "Pools with Dirty Water"),
            SearchItems(imageName: "Extremely Dirty", group: "Pools with Dirty Water"),
            SearchItems(imageName: "Identifying Stains", group: "Pools with Dirty Water")
        ]
        
        navigationItem.title = "Pool Problems Search Gallery"
        
        //setup the search controller
        searchController = ({
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.dimsBackgroundDuringPresentation = false
            
            // Setup the search bar
            searchController.searchBar.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            self.searchBarContainer?.addSubview(searchController.searchBar)
            
            // SearchBar setup
            searchController.searchBar.scopeButtonTitles = ["All", "Pools with Algae Problems", "Pools with Metal Problems", "Pools with Organic Stains", "Pools with Dirty Water"]
            searchController.searchBar.delegate = self
            
            // Possible bug fix
            searchController.searchBar.sizeToFit()
            
            return searchController
        })()
    }
    
    func searchIsEmpty() -> Bool {
        
        if let searchTerm = self.searchController?.searchBar.text {
            return searchTerm.isEmpty
        }
        return true
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
        if searchIsEmpty() {
            isDataFiltered = false
        } else {
            filteredSearch = searchItems.filter { searchItem in
                if (self.searchController?.searchBar.text) != nil {
                    let categoryMatch = (scope == "All") || (searchItem.group == scope)
                    return  categoryMatch && searchItem.imageName.lowercaseString.containsString(searchText.lowercaseString)
                }
                return false
            }
            isDataFiltered = true
        }
    }
    
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        // Dismiss the keyboard if the search results are scrolled
        searchController?.searchBar.resignFirstResponder()
    }

    
    // MARK: UICollectionViewDataSource

    // MARK: Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataSource.numberOfGroups() //dataSource.groups.count
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.active {// || searchController.searchBar.text != "" {
            print(filteredSearch.count)
            return filteredSearch.count
        }
        print(dataSource.numberOfRowsInEachGroup(section))
        return dataSource.numberOfRowsInEachGroup(section)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photo, forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        let searchItem: SearchItems
        if searchController.active && searchController.searchBar.text != "" {
            searchItem = filteredSearch[indexPath.row]
        } else {
            searchItem = searchItems[indexPath.row]
        }
        
        // Sourcing data from datasource within poolsInGroup
        let pools: [SearchItems] = dataSource.poolsInGroup(indexPath.section)
        let pool = pools[indexPath.row]
        
        let imageName = pool.imageName
        
        cell.galleryImages.image = UIImage(named: searchItem.imageName)
        cell.imageName.text = imageName
        
        return cell
    }
    
    // MARK: Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeader, forIndexPath: indexPath) as! HeaderReusableView
        
        // Sourcing data from datasource within poolsInGroup
        let pools: [SearchItems] = dataSource.poolsInGroup(indexPath.section)
        let pool = pools[indexPath.row]
        
        let group = pool.group
        
        // Displays group protocol to header view label
        headerView.sectionTitle.text = group
        
        return headerView
    }
    
    // Search bar attributes
    
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

// This class extension allows for the array to be of different counts due to search results
extension GalleryViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope!)
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
