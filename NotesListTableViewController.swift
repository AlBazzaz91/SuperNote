//
//  NotesListTableViewController.swift
//  SuperNote
//
//  Created by hussein albazaz on 5/21/16.
//  Copyright © 2016 hussein. All rights reserved.
//

import UIKit
import CoreData

class NotesListTableViewController: UITableViewController {
    
    var notes: [Notebook]=[]
    var moc: NSManagedObjectContext!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Notebook", inManagedObjectContext: moc)
        
        fetchRequest.entity = entityDescription
        
        
        //var items = [Notebook]()
        do{
            try notes = moc.executeFetchRequest(fetchRequest) as! [Notebook]
        }catch{
            print(error)
        }

        
        
        
        tableView.reloadData()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        /*var note1 = Note()
        note1.title = "Note 1"
        note1.content = "Note 1 content"
        
        var note2 = Note()
        note2.title = "Note 2"
        note2.content = "Note 2 content"
        
        var note3 = Note()
        note3.title = "Note 3"
        note3.content = "Note 3 content"
        
        notes.appendContentsOf([note1, note2, note3])
 */
 }

    override func viewDidLoad() {
        super.viewDidLoad()
        moc = CoreDataHelper.managedObjectContext()
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NotesCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = notes[indexPath.row].title
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("newSegue", sender: indexPath)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        moc.deleteObject(notes[indexPath.row])
        do{
            try moc.save()
        }catch{
            print(error)
        }
        notes.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender is NSIndexPath{
            
        }
        if segue.identifier! == "showNote"
        {
            var noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow!
            
            let fetchRequest = NSFetchRequest()
            let entityDescription = NSEntityDescription.entityForName("Notebook", inManagedObjectContext: moc)
            
            fetchRequest.entity = entityDescription
            
            
            var items = [Notebook]()
            do{
                try items = moc.executeFetchRequest(fetchRequest) as! [Notebook]
            }catch{
                print(error)
            }
            
            
            
            noteDetailViewController.note = items[selectedIndexPath.row]
            noteDetailViewController.iD = "showNote"
        }
        if segue.identifier! == "addNote"
        {
            //var Note1 = Notebook()
            //notes.append(note)
            var noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
             var Note1 = NSEntityDescription.insertNewObjectForEntityForName("Notebook", inManagedObjectContext: moc) as! Notebook
            
            
            
            
            noteDetailViewController.note = Note1
            noteDetailViewController.iD = "addNote"
        }
        
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
