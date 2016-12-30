//
//  GalleryViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate, UISearchBarDelegate, UIScrollViewDelegate {
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var poolGallery: [PoolProblems] = {
        return PoolProblems.poolGallery()
    }()
    
    var problems = [Problems]()
    var filteredPools = [Problems]()
    
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
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
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
            searchController.searchBar.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            self.searchBarContainer.addSubview(searchController.searchBar)
            searchController.searchBar.returnKeyType = UIReturnKeyType.done
            
            // SearchBar delegate
            searchController.searchBar.delegate = self

            // Possible bug fix
            searchController.searchBar.sizeToFit()

            return searchController
        })()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("Section: \(poolGallery.count)")
        return poolGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPools.count
        }
        let poolProblems = poolGallery[section]
        print("Items: \(poolProblems.solutions.count)")
        return poolProblems.solutions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(11, 11, 11, 11)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 11.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 11.0
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photo, for: indexPath) as? GalleryCell {
            
            if inSearchMode {
                let solutions = filteredPools[indexPath.row]
                let title = solutions.title
                let image = solutions.image
                let solution = solutions.solution
                
                // Displays name protocol to cell image and label
                let problems = Problems(title: title, image: image, solution: solution)
                cell.configureCell(problems)
                
            } else {
                let poolProblems = poolGallery[indexPath.section]
                let solutions = poolProblems.solutions[indexPath.row]
                
                let problems = Problems(title: solutions.title, image: solutions.image, solution: solutions.solution)
                cell.configureCell(problems)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    

    // MARK: Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeader, for: indexPath) as! HeaderReusableView
        
        // Sourcing data from datasource within poolsingroup to isolate the group protocol
        let poolProblems = poolGallery[indexPath.section]
        let gallery = poolProblems.gallery
        // Displays group protocol to header view label
        headerView.sectionTitle.text = gallery
        
        return headerView
    }
    
    // Search bar attributes
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        // Clear any search criteria
        searchController.searchBar.text = ""
        
        // Dismiss the keyboard
        searchController.searchBar.resignFirstResponder()
    }
    
    
    //MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchController.searchBar.text!.lowercased()
            
            filteredPools = problems.filter({$0.image.range(of: lower) != nil})
            collectionView.reloadData()
        }
    }
    

    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Dismiss the keyboard if the search results are scrolled
        searchController?.searchBar.resignFirstResponder()
    }
    

    // MARK: Segue to details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == gallerySegue {
            let destination = segue.destination as! GalleryDetailVC
            if let indexPath = collectionView.indexPath(for: sender as! UICollectionViewCell) {
                let problems: Problems
                if searchController.isActive && searchController.searchBar.text != "" {
                    problems = filteredPools[indexPath.row]
                } else {
                    let poolProblems = poolGallery[indexPath.section]
                    problems = poolProblems.solutions[indexPath.row]
                }
                destination.detailTitle = problems.title
                destination.problemImage = UIImage(named: problems.image)
                destination.descriptions = problems.solution
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredPools = problems.filter { data in
            return data.title.lowercased().contains(searchText.lowercased())
        }
        collectionView.reloadData()
    }
}

// This class extension allows for the array to be of different counts due to search results
extension GalleryViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        self.collectionView.reloadData()
    }
}
