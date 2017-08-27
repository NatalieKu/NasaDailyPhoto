//
//  NasaDetailViewController.swift
//  NasaDailyPhoto
//
//  Created by MEI KU on 2017/8/28.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class NasaDetailViewController: UIViewController {
    
    var nasa: Nasa!
   
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var descriptionLabel: UILabel!
    
  
    
    func updateUI() {
        navigationItem.title = nasa.date
        titleLabel.text = nasa.title
        descriptionLabel.text = nasa.explanation
      NasaController.shared.fetchImage(url: nasa.url) { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
