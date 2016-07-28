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
    var filteredPools = [ImageData]()
    var poolData = [PoolData]()
    var problem = Problems()
    
    var dataSource = DataSource()
    
    var inSearchMode = false
    
    // Outlet for the display of collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Problems Search Gallery"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        // Create collection view delegate
        collectionView.delegate = self
        collectionView.dataSource = self
                
        
        //Setup the search controller
        searchController = ({
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.dimsBackgroundDuringPresentation = false

            // Setup the search bar
            searchController.searchBar.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            self.searchBarContainer.addSubview(searchController.searchBar)
            searchController.searchBar.returnKeyType = UIReturnKeyType.Done
            
            // SearchBar delegate
            searchController.searchBar.delegate = self

            // Possible bug fix
            searchController.searchBar.sizeToFit()

            return searchController
        })()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        print("Groups: \(dataSource.groups.count)")
        return dataSource.groups.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPools.count
        }
        print("Images: \(dataSource.poolsInGroup(section).count)")
        let pools = dataSource.poolsInGroup(section).count
        
        return pools
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
            
            if inSearchMode {
                let pool = filteredPools[indexPath.row]
                let image = pool.image
                let group = pool.group
                
                // Displays name protocol to cell image and label
                let imageData = ImageData(image: image, group: group)
                cell.configureCell(imageData)
                
            } else {
                let pools: [ImageData] = dataSource.poolsInGroup(indexPath.section)
                let pool = pools[indexPath.row]
                
                let image = pool.image
                let group = pool.group
                
                let imageData = ImageData(image: image, group: group)
                cell.configureCell(imageData)
            }
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
        let group = pool.group
        // Displays group protocol to header view label
        headerView.sectionTitle.text = group
        
        return headerView
    }
    
    // Search bar attributes
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
        // Clear any search criteria
        searchController.searchBar.text = ""
        
        // Dismiss the keyboard
        searchController.searchBar.resignFirstResponder()
    }
    
    
    //MARK: - UISearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchController.searchBar.text!.lowercaseString
            
            filteredPools = imageData.filter({$0.image.rangeOfString(lower) != nil})
            collectionView.reloadData()
        }
    }
    

    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // Dismiss the keyboard if the search results are scrolled
        searchController?.searchBar.resignFirstResponder()
    }
    

    // MARK: Segue to details
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == gallerySegue {
            let destination = segue.destinationViewController as! GalleryDetailVC
            if let indexPath = collectionView.indexPathForCell(sender as! UICollectionViewCell) {
                let imageData: ImageData
                let problem: Problems
                if searchController.active && searchController.searchBar.text != "" {
                    
                    imageData = filteredPools[indexPath.row]
                } else {
                    imageData = dataSource.pools[indexPath.row]
                }
                destination.detailTitle = imageData.image
                destination.problemImage = UIImage(named: imageData.image)
                destination.descriptions = problem.problem
            }
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredPools = imageData.filter { data in
            return data.image.lowercaseString.containsString(searchText.lowercaseString)
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func unwindActionToPoolProblems(unwindSegue: UIStoryboardSegue) {}
}

// This class extension allows for the array to be of different counts due to search results
extension GalleryViewController: UISearchResultsUpdating {
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        self.collectionView.reloadData()
    }
}
