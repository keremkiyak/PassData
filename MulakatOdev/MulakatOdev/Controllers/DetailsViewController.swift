//
//  DetailsViewController.swift
//  MulakatOdev
//
//  Created by kerem on 6.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var labelName: UILabel!
    
    
    @IBOutlet weak var labelText: UILabel!
    
    
    
    
    var image = UIImage()
    
    var name = ""
    
    var text = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        labelName.text = name
        labelText.text = text
        
    }
    

    
    
    
    

}
