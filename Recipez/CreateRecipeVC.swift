//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Chris Nowak on 6/6/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // IBOutlets
    
    @IBOutlet weak var recipleTitleField: UITextField!
    @IBOutlet weak var recipeIngredientsField: UITextField!
    @IBOutlet weak var recipeStepsField: UITextField!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    // Variables
    
    var imagePicker: UIImagePickerController!
    
    // View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeImageView.layer.cornerRadius = 4.0
        self.recipeImageView.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
    }
    
    // UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.recipeImageView.image = image
    }
    
    // IBActions
    
    @IBAction func addImageButtonPressed(sender: AnyObject!) {
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipeButtonPressed(sender: AnyObject!) {
        if let title = self.recipleTitleField.text where title != "" {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            recipe.title = title
            recipe.ingredients = self.recipeIngredientsField.text
            recipe.steps = self.recipeStepsField.text
            recipe.setRecipeImage(self.recipeImageView.image!)
            context.insertObject(recipe)
            do {
                try context.save()
            } catch {
                print("Could not save recipe!")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}
