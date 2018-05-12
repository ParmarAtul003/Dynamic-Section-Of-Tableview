//
//  FilterSectionVC.swift
//  ContentPlaceholderLoader
//
//  Created by Sufalam 4 on 11/05/18.
//  Copyright © 2018 Sufalam 4. All rights reserved.
//

import UIKit

class FilterSectionVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var arritemList = ["Milk","Butter","aRCHETYPE","ARCHITECT","AROMA","AROUSE","AROUSED","BADASS",
                       "BADASSERY","BALANCE","BALANCED","bALL","OFFIRE","BALLSY","BALMY","BAM",
                       "CAJOLE","CALM","CALMATIVECALMING","CAN","CANDESCENT","CANDIDLY","DABBLE",
                       "DAIMON","EAGER","EXULTINGLY","fAVOURITE","FEARLESS","GENTLE","GENTLEMAN",
                       "HAPPINESS","HAPPY","IMPRESSES","IMPRESSIVE","INVENTOR","INVENTORY","JOYFULLY",
                       "JOYOUS","JOYOUSLY","KNOWING","KNOWINGLY","KNOWLEDGE","LIGHTEN","LIKABLE",
                       "LIKES","MAGIC","MAGICIAN","MANAGE","NOON","NORMAL","OUTCOME","OVER",
                       "OVERTOOK","PHILOSOPHICAL","PILOT","PLAY","POSITIVE","REFLECTIVE","RELIEVED",
                       "SCION","SECOND","SELFLESS","Test","Tost"]
    var arrFilterItem = [String:[String]]()
    var letterArray = [String]()
    var sectionLetter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
                         "R","S","T","U","V","W","X","Y","Z","#"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in arritemList{
            let itemKey = String(item.prefix(1)).uppercased()
            if var itemValue = arrFilterItem[itemKey]{
                itemValue.append(item)
                arrFilterItem[itemKey] = itemValue
            }else{
                arrFilterItem[itemKey] = [item]
            }
        }
        
        letterArray = [String](arrFilterItem.keys)
        letterArray = letterArray.sorted()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return letterArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemkey = letterArray[section]
        if let itemvalue = arrFilterItem[itemkey]{
            return itemvalue.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letterArray[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CEllFIlterIdetifier")
        let itemkey = letterArray[indexPath.section]
        if let itemvalue = arrFilterItem[itemkey]{
            cell?.textLabel?.text = itemvalue[indexPath.row]
        }
        
        return cell!
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionLetter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
