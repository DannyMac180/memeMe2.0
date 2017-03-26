//
//  MemeCollectionViewController.swift
//  MemeMe2.0
//
//  Created by Daniel McAteer on 3/7/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memes = appDelegate.memes
        
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MemeCollectionVC count is \(self.memes.count)")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memes = appDelegate.memes
        self.collectionView!.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.memes.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath){
      
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
