//
//  RecipeCell.swift
//  Recipez
//
//  Created by Chris Nowak on 6/6/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    // IBOutlets
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    // View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Custom Helper Methods
    
    func configureCell(recipe: Recipe) {
        self.recipeTitleLabel.text = recipe.title
        self.recipeImageView.image = recipe.getRecipeImage()
    }

}
