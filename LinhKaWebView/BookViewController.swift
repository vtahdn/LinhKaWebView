//
//  BookViewController.swift
//  LinhKaWebView
//
//  Created by macbook on 10/12/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var type: String!
    
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    
    let booksHTML = [
        ("Lập trình iOS Objective-C")
    ]
    
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get type from this title
        type = tabBarItem.title!
 
    }

    // The number of items in this view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count: Int = 0
        
        switch type {
        case "PDF":
            count = booksPDF.count
        case "HTML":
            count = booksHTML.count
        case "DOCX":
            count = booksDocx.count
        default:
            break
        }
        
        return count
    }
    
    // Data for Cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BookCollectionViewCell
        var thumbnail: UIImage!
        var nameLabel: String!
        
        switch type {
        case "PDF":
            thumbnail = UIImage(named: booksPDF[indexPath.item] + ".jpg")
            nameLabel = booksPDF[indexPath.item]
        case "DOCX":
            thumbnail = UIImage(named: booksDocx[indexPath.item] + ".jpg")
            nameLabel = booksDocx[indexPath.item]
        case "HTML":
            thumbnail = UIImage(named: booksHTML[indexPath.item] + ".jpg")
            nameLabel = booksHTML[indexPath.item]
        default:
            break
        }
        
        cell.imageView.image = thumbnail
        cell.nameLabel.text = nameLabel
        
        return cell
    }
    
    // Select a item
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let bookDetailViewController = storyboard?.instantiateViewControllerWithIdentifier("BookDetail") as! BookDetailViewController
        
        var urlString: String!
        
        switch type {
        case "PDF":
            urlString = booksPDF[indexPath.item]
        case "DOCX":
            urlString = booksDocx[indexPath.item]
        case "HTML":
            urlString = booksHTML[indexPath.item]
        default:
            break
        }
        
        bookDetailViewController.urlString = urlString
        bookDetailViewController.type = type
        navigationController?.pushViewController(bookDetailViewController, animated: true)
        
    }
    
    
    
    
    
    
    
    
    


}
