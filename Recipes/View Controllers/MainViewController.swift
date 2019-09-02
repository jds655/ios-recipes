//
//  MainViewController.swift
//  Recipes
//
//  Created by Joshua Sharp on 9/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = []{
        didSet{
            filterRecipes()
        }
    }
    var filteredRecipes: [Recipe] = []{
        didSet{
            recipesTableViewController.recipes = filteredRecipes
        }
    }
    private var recipesTableViewController: RecipesTableViewController!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchRecipes(completion: {recipes, error  in
            if let error = error {
                NSLog("Error fetching recipes: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.allRecipes = recipes ?? []
            }
        })
    }
    
    private func filterRecipes () {
        if let filterText = searchTextField.text, !filterText.isEmpty {
            filteredRecipes = allRecipes.filter { $0.name.contains(filterText) || $0.instructions.contains(filterText)}
        } else {
            filteredRecipes = allRecipes
        }
    }
    
    @IBAction func searchEdited(_ sender: Any) {
        searchTextField.resignFirstResponder()
        filterRecipes()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        recipesTableViewController = (segue.destination as! RecipesTableViewController)
    }
}
