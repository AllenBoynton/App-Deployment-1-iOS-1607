//
//  GalleryViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate, UISearchBarDelegate, UIScrollViewDelegate {
    
    // Custom object array
    let searchImages = [
    SearchImages(image: "Green Algae", group: "Pools with Algae Problems"),
    SearchImages(image: "Mustard Yellow Algae", group: "Pools with Algae Problems"),
    SearchImages(image: "Black Algae", group: "Pools with Algae Problems"),
    SearchImages(image: "Metal Rust Stains", group: "Pools with Metal Problems"),
    SearchImages(image: "Copper Metal Stains", group: "Pools with Metal Problems"),
    SearchImages(image: "Iron Metal Stains", group: "Pools with Metal Problems"),
    SearchImages(image: "Manganese Metal Stains", group: "Pools with Metal Problems"),
    SearchImages(image: "Oily Water Line", group: "Pools with Organic Stains"),
    SearchImages(image: "Organic Stains", group: "Pools with Organic Stains"),
    SearchImages(image: "Organic Berry Stains", group: "Pools with Organic Stains"),
    SearchImages(image: "Surface Debris", group: "Pools with Dirty Water"),
    SearchImages(image: "Extremely Dirty", group: "Pools with Dirty Water"),
    SearchImages(image: "Identifying Stains", group: "Pools with Dirty Water")
        
    ]
    
    // Stored properties passed in from class Datasource
    var filteredSearch: [SearchImages] = []
    
    
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
        
        // Create collection view delegate
        collectionView.delegate = self
        collectionView.dataSource = self
                
        navigationItem.title = "Pool Problems Search Gallery"
        
        //Setup the search controller
        searchController = ({
            let searchController = UISearchController(searchResultsController: nil)
//            searchController.searchResultsUpdater = self
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.dimsBackgroundDuringPresentation = false

            // Setup the search bar
            searchController.searchBar.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            self.searchBarContainer.addSubview(searchController.searchBar)

            // SearchBar delegate
            searchController.searchBar.delegate = self

            // Possible bug fix
            searchController.searchBar.sizeToFit()

            return searchController
        })()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photo, forIndexPath: indexPath) as? GalleryCell {
            
            let searchImages = SearchImages(image: "Green Algae", group: "Pools with Algae Problems")
             
                cell.configureCell(searchImages)
                return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> Int {
        
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 13
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(110, 110)
    }
    
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        // Dismiss the keyboard if the search results are scrolled
        searchController?.searchBar.resignFirstResponder()
    }

    
    // MARK: Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeader, forIndexPath: indexPath) as! HeaderReusableView
        
        let headerTitle = searchImages[indexPath.section]
        
        // Displays group protocol to header view label
        headerView.sectionTitle.text = headerTitle.group
        
        return headerView
    }
    
    // Search bar attributes
    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        // Clear any search criteria
//        searchBar.text = ""
//        
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//    }
//    // MARK: Segue to details
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == gallerySegue {
//            if let indexPath = collectionView.indexPathForCell(sender as! UICollectionViewCell) {
//                let earchImages: SearchImages
//                if searchController.active && searchController.searchBar.text != "" {
//                    searchImages = filteredSearch[indexPath.row]
//                } else {
//                    searchImages = searchImages[indexPath.row]
//                }
//                let controller = segue.destinationViewController as! GalleryDetailVC
//                controller.poolDetail = searchItem
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
}

// This class extension allows for the array to be of different counts due to search results
//extension GalleryViewController: UISearchResultsUpdating {
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
//        filteredSearch(searchController.searchBar.text!, scope: scope!)
//    }
//    
//    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filteredSearch(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//}
