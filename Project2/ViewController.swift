//
//  ViewController.swift
//  SWIFTNNProject3
//
//  Created by Brian Rouse on 8/29/17.
//  Copyright © 2017 Brian Rouse. All rights reserved.
///

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    let mode = GoogLeNetPlaces()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as? UIImageView
        
        if let imageToAnalyse = imageView?.image {
            
            if let sceneLabelString = sceneLabel(forImage: imageToAnalyse) {
                categoryLabel.text = sceneLabelString
            }
        }
        
        
    }
    
    func sceneLabel(forImage image: UIImage) -> String? {
//        mode.prediction(sceneImage: <#T##CVPixelBuffer#>)
//        return nil
        
        if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
            guard let scene = try? mode.prediction(sceneImage: pixelBuffer) else { fatalError("CoreML runtim error") }
            return scene.sceneLabel
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


