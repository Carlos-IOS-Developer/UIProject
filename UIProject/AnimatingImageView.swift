 //
//  AnimatingImageView.swift
//  UIProject
//
//  Created by Carlos Reda on 1/1/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class AnimatingImageView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var AnimateBtn: UIButton!
    
    var emoji : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emoji = creatImageArray(total: 3 , imagePrefix: "emoji")
       
        // Do any additional setup after loading the view.
    }

    func creatImageArray(total: Int, imagePrefix: String)->[UIImage]{
        var imageArray : [UIImage] = []
        for imageCount in 0..<total{
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)
            imageArray.append(image!)
            
        }
        return imageArray
     
    }
    func animate (imageView: UIImageView , images: [UIImage]){

        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
        
    }
    @IBAction func Animate(_ sender: Any) {
        animate(imageView: imageView, images: emoji)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
