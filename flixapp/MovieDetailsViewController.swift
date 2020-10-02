//
//  MovieDetailsViewController.swift
//  flixapp
//
//  Created by Priscila Almeida on 9/26/20.
//  Copyright © 2020 Priscila Almeida. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var sinopsesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    
  
   
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                posterView.isUserInteractionEnabled = true
                posterView.addGestureRecognizer(tapGestureRecognizer)


        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        sinopsesLabel.text = movie["overview"] as? String
        sinopsesLabel.sizeToFit()
        
       
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        backdropView.af_setImage(withURL: backdropURL!)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){

        self.performSegue(withIdentifier: "showTrailer", sender: self)
            
            }
   

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let trailerViewController = segue.destination as! TrailerViewController


        trailerViewController.id = movie!["id"] as! NSNumber
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
