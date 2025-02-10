//
//  DetailViewController.swift
//  Project1b
//
//  Created by David Harris on 2/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    var pictures: [String] = []
//    var selectedPictureNumber = 0
//    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        
        var selectedPictureNumber = 0
        let totalPictures = pictures.count
        var countTitle: String
//
//        countTitle = "Picture \(selectedPictureNumber) of \(totalPictures)"
//        title = countTitle
//
//        while selectedPictureNumber < totalPictures {
//            selectedPictureNumber += 1
//            print(countTitle)
//        }
//
        
        title = countTitle
        
//        title = selectedImage
        
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
