//
//  NoteDetailViewController.swift
//  SuperNote
//
//  Created by hussein albazaz on 5/21/16.
//  Copyright © 2016 hussein. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var note: Note!
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        note.title = titleTextField.text!
        note.content = contentTextField.text
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleTextField.text = note.title
        contentTextField.text = note.content
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveButton: UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(NoteDetailViewController.saveButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = saveButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveButtonPressed(sender: UIBarButtonItem){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
