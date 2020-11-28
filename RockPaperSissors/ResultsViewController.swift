//
//  ResultsViewController.swift
//  RockPaperSissors
//
//  Created by Tijo Jose on 11/26/20.
//

import UIKit

class ResultsViewController: UIViewController{
    
    var imageString: String?
    var resultString: String?
    
    @IBOutlet weak var results_Text_view: UITextField!
    @IBOutlet weak var result_image_view: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        print("RESULT : \(resultString!)")
        print("IMAGE CHOICE : \(imageString!)")
        
        results_Text_view.text = resultString
        result_image_view.image = UIImage(named: imageString!)
        
        self.results_Text_view.alpha = 0
        self.result_image_view.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2){
            self.results_Text_view.alpha = 1
            self.result_image_view.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
