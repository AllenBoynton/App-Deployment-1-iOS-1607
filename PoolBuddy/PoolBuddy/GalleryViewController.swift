//
//  GalleryViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate, UISearchBarDelegate, UIScrollViewDelegate {
    
    var imageData = [ImageData]()
    var filteredSearch = [ImageData]()
    
    var poolData = [PoolData]()
    
    var dataSource = DataSource()
    
    var inSearchMode = false
    
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
        
        // Gallery array that is setup in Pools.plist
//        imageData = [
//            ImageData(image: "Green Algae", group: "Pools with Algae Problems"),
//            ImageData(image: "Mustard Yellow Algae", group: "Pools with Algae Problems"),
//            ImageData(image: "Black Algae", group: "Pools with Algae Problems"),
//            ImageData(image: "Metal Rust Stains", group: "Pools with Organic Stains"),
//            ImageData(image: "Copper Metal Stains", group: "Pools with Organic Stains"),
//            ImageData(image: "Iron Metal Stains", group: "Pools with Organic Stains"),
//            ImageData(image: "Manganese Metal Stains", group: "Pools with Organic Stains"),
//            ImageData(image: "Oily Water Line", group: "Pools with Metal Problems"),
//            ImageData(image: "Organic Stains", group: "Pools with Metal Problems"),
//            ImageData(image: "Organic Berry Stains", group: "Pools with Metal Problems"),
//            ImageData(image: "Cloudy Water", group: "Pools with Dirty Water"),
//            ImageData(image: "Surface Debris", group: "Pools with Dirty Water"),
//            ImageData(image: "Extremely Dirty", group: "Pools with Dirty Water"),
//            ImageData(image: "Identifying Stains", group: "Pools with Dirty Water")
//        ]
        
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> Int {
        
        return dataSource.groups.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if inSearchMode {
            return filteredSearch.count
        }
        return imageData.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(110, 110)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(11, 11, 11, 11)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 11.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 11.0
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photo, forIndexPath: indexPath) as? GalleryCell {
            
            let data: ImageData!
            
            if inSearchMode {
                data = filteredSearch[indexPath.row]
            } else {
                data = imageData[indexPath.row]
            }
            cell.configureCell(data)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    // MARK: Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeader, forIndexPath: indexPath) as! HeaderReusableView
        
        // Sourcing data from datasource within poolsingroup to isolate the group protocol
        let pools: [ImageData] = dataSource.poolsInGroup(indexPath.section)
        let pool = pools[indexPath.row]
        
        let groups = pool.group
        
        // Displays group protocol to header view label
        headerView.sectionTitle.text = groups
        
        return headerView
    }
    
    // Search bar attributes
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        // Clear any search criteria
        searchBar.text = ""
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    
    //MARK: - UISearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let search = searchBar.text!.lowercaseString
            
            filteredSearch = imageData.filter({$0.image.rangeOfString(search) != nil})
            collectionView.reloadData()
        }
    }
    

    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // Dismiss the keyboard if the search results are scrolled
        searchController?.searchBar.resignFirstResponder()
    }
    

    // MARK: Segue to details
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == gallerySegue {
//            if let indexPath = collectionView.indexPathForCell(sender as! UICollectionViewCell) {
//                let data: ImageData
//                if searchController.active && searchController.searchBar.text != "" {
//                    data = filteredSearch[indexPath.row]
//                    print(data)
//                }
//                let destination = segue.destinationViewController as! GalleryDetailVC
//                destination.filteredDetail = data
//                destination.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
//                destination.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
}

//// This class extension allows for the array to be of different counts due to search results
//extension GalleryViewController: UISearchResultsUpdating {
//    
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        filteredSearch.removeAll(keepCapacity: false)
//        
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        let array = (poolData as NSArray).filteredArrayUsingPredicate(searchPredicate)
//        filteredSearch = array as! [ImageData]
//        
//        self.collectionView.reloadData()
//    }
//}
