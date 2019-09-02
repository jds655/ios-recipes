//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Joshua Sharp on 9/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    var recipe: Recipe?{
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        if isViewLoaded {
            if let recipeText = recipe?.name { recipeLabel.text = recipeText}
            if let recipeInstructions = recipe?.instructions { recipeTextView.text = recipeInstructions}
        }
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
