//
//  MemeDetailViewController.swift
//  MemeMe2.0
//
//  Created by Daniel McAteer on 3/7/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//


import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
        self.imageView!.image = self.meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }

}
