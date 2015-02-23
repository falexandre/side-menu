//
//  MenuTableViewController.swift
//  side-menu
//
//  Created by Thiago Abreu on 2/22/15.
//  Copyright (c) 2015 Thiago Abreu. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var selectedMenuItem : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor(red: 44/255.0, green: 61/255.0, blue: 80/255.0, alpha: 1)
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        
        if (cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
            
        }
        
        if(indexPath.row == 0){
            
            var image = UIImage(named: "texto-minha-localizacao.png");
            var imageView = UIImageView(frame: CGRectMake(70, 0, 463/2, 134/2));
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = image;
            self.view.addSubview(imageView);
            
            cell?.addSubview(imageView)
            
            var image_icon = UIImage(named: "img-localizacao.png");
            var imageView_icon = UIImageView(frame: CGRectMake(5, 0, 127/2, 134/2));
            imageView_icon.backgroundColor = UIColor.clearColor()
            imageView_icon.image = image_icon;
            self.view.addSubview(imageView_icon);
            
            cell?.addSubview(imageView_icon)
            
        }
        else if (indexPath.row == 1){
            
            var image = UIImage(named: "texto-ta-bombando.png");
            var imageView = UIImageView(frame: CGRectMake(70, 0, 463/2, 134/2));
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = image;
            self.view.addSubview(imageView);
            
            cell?.addSubview(imageView)
            
            var image_icon = UIImage(named: "img-tabombando.png");
            var imageView_icon = UIImageView(frame: CGRectMake(5, 0, 127/2, 134/2));
            imageView_icon.backgroundColor = UIColor.clearColor()
            imageView_icon.image = image_icon;
            self.view.addSubview(imageView_icon);
            
            cell?.addSubview(imageView_icon)
            
        }
        else if (indexPath.row == 2){
            
            var image = UIImage(named: "texto-meus-favoritos.png");
            var imageView = UIImageView(frame: CGRectMake(70, 0, 463/2, 134/2));
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = image;
            self.view.addSubview(imageView);
            
            cell?.addSubview(imageView)
            
            var image_icon = UIImage(named: "img-meus-favoritos.png");
            var imageView_icon = UIImageView(frame: CGRectMake(5, 0, 127/2, 134/2));
            imageView_icon.backgroundColor = UIColor.clearColor()
            imageView_icon.image = image_icon;
            self.view.addSubview(imageView_icon);
            
            cell?.addSubview(imageView_icon)
        }
        else if (indexPath.row == 3){
            
            var image = UIImage(named: "texto-sobre.png");
            var imageView = UIImageView(frame: CGRectMake(70, 0, 463/2, 134/2));
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = image;
            self.view.addSubview(imageView);
            
            cell?.addSubview(imageView)
            
            var image_icon = UIImage(named: "img-sobre.png");
            var imageView_icon = UIImageView(frame: CGRectMake(5, 0, 127/2, 134/2));
            imageView_icon.backgroundColor = UIColor.clearColor()
            imageView_icon.image = image_icon;
            self.view.addSubview(imageView_icon);
            
            cell?.addSubview(imageView_icon)
            
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 134.0 / 2
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //println("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        
        var destViewController : UIViewController
        
        switch (indexPath.row) {
            
        case 0:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("view1") as UIViewController
            break
            
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("view2") as UIViewController
            break
            
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("view3") as UIViewController
            break
            
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("view4") as UIViewController
            break
        }
        
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}
