//
//  AddShowViewController.swift
//  SwagFlix
//
//  Created by Manouana on 12/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit
import UserNotifications

class AddShowViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBOutlet weak var urlImage: UITextField!

    @IBOutlet weak var titleTxtView: UITextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    
    @IBOutlet weak var frequencePicker: UIPickerView!
    let frequencePickerData = ["Quotidien", "Hebdomadaire", "Mensuel"]
    var frequenceSelected:String?

    @IBOutlet weak var notificationPicker: UIPickerView!
    let notificationPickerData = ["00:00", "01:00", "02:00", "03:00", "04:00", "06:00", "07:00",
                                  "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00",
                                  "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00",
                                  "22:00", "23:00"]
    var notificationSelected:String?

    @IBOutlet weak var dayPicker: UIPickerView!
    let dayPickerData = ["Lundi", "Mardi", "Mercredi", "Jeudi",  "Vendredi", "Samedi", "Dimanche"]
    var daySelected:String?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frequencePicker.dataSource = self
        self.frequencePicker.delegate = self
        self.notificationPicker.dataSource = self
        self.notificationPicker.delegate = self
        self.dayPicker.dataSource = self
        self.dayPicker.delegate = self
        
        frequenceSelected = frequencePickerData[0]
        notificationSelected = notificationPickerData[0]
        daySelected = dayPickerData[0]
        
        self.title = "Ajouter série"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //---------------------
    //Notif Part
    
    func scheduleLocal(myTvShow : TvShowClass, hourNotif: Int) {

        let notification = UILocalNotification()
        let titleMessage:String = "Nouvel épisode disponible"
        let bodyMessage:String = "Un épisode de la serie " + myTvShow.title + " est disponible !"
        
        var calendar = NSCalendar.current
        let calendarComponents = NSDateComponents()
        calendarComponents.hour = hourNotif
        calendarComponents.second = 0
        calendarComponents.minute = 00
        
        if myTvShow.frequecy_out != "Quotidien"{
            if myTvShow.day_out ==      "Lundi"     { calendarComponents.weekday = 2  }
            else if myTvShow.day_out == "Mardi"     { calendarComponents.weekday = 3  }
            else if myTvShow.day_out == "Mercredi"  { calendarComponents.weekday = 4  }
            else if myTvShow.day_out == "Jeudi"     { calendarComponents.weekday = 5  }
            else if myTvShow.day_out == "Vendredi"  { calendarComponents.weekday = 6  }
            else if myTvShow.day_out == "Samedi"    { calendarComponents.weekday = 7  }
            else if myTvShow.day_out == "Dimanche"  { calendarComponents.weekday = 1  }
        }
        
        calendar.timeZone = NSTimeZone.default
        let dateToFire = calendar.date(from: calendarComponents as DateComponents)
        
        let dict:NSDictionary = ["title" : myTvShow.title]
        notification.userInfo = dict as! [String : String]
        notification.alertBody = "\(bodyMessage)"
        notification.alertAction = "Open"
        notification.alertTitle = titleMessage
        notification.fireDate = dateToFire
        
        if myTvShow.frequecy_out == "Quotidien"{
            notification.repeatInterval = NSCalendar.Unit.weekday
        }
        if myTvShow.frequecy_out == "Hebdomadaire"{
            notification.repeatInterval = NSCalendar.Unit.weekOfYear
        }
        if myTvShow.frequecy_out == "Mensuel"{
            notification.repeatInterval = NSCalendar.Unit.month
        }
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    
    
    func addLocal(myTvShow : TvShowClass, hourNotif: Int) {
        
        let dataHelper = TvShowDataHelper.sharedInstance
        let acualView = self
        
        let shows :[TvShowClass] = dataHelper.getAllTvShows()
        if (shows.count < 64) {
            
            let object = dataHelper.addTvShow(myTvShowClass: myTvShow)
            if(object != nil){
                
                scheduleLocal(myTvShow: myTvShow, hourNotif: hourNotif)
                
                let alert = UIAlertController(title: "Attention", message: "Votre série a bien été ajoutée", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert: UIAlertAction) in
                    acualView.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "Attention", message: "Votre série n'a pas pu etre ajoutée pour une raison inconnue", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert: UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        else{
            let alert = UIAlertController(title: "Attention", message: "Votre série n'a pas pu etre ajoutée car le nombre maximum d'alertes a été atteint", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }


    }
    
    //End Notif
    //---------------------
    //Picker Part
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == frequencePicker{
            return frequencePickerData.count
        }
        else if pickerView == notificationPicker{
            return notificationPickerData.count
        }
        else if pickerView == dayPicker{
            return dayPickerData.count
        }
        else{
            return 0
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == frequencePicker{
            return frequencePickerData[row]
        }
        else if pickerView == notificationPicker{
            return notificationPickerData[row]
        }
        else if pickerView == dayPicker{
            return dayPickerData[row]
        }
 
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == frequencePicker{
            frequenceSelected = frequencePickerData[row]
        }
        else if pickerView == notificationPicker{
            notificationSelected = notificationPickerData[row]
        }
        else if pickerView == dayPicker{
            daySelected = dayPickerData[row]
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    //End Picker
    //---------------------
    
    
    @IBAction func onTouchInsert(_ sender: AnyObject) {
        
        let titleString : String = titleTxtView.text!
        let frequenceString : String = frequenceSelected!
        var notificationString : String = notificationSelected!
        let dayOutString : String = daySelected!
        let descriptionString : String = descriptionTxtView.text
        let imageString : String = urlImage.text!
        
        if titleString.isEmpty || frequenceString.isEmpty || notificationString.isEmpty || dayOutString.isEmpty || descriptionString.isEmpty || imageString.isEmpty{
            let alert = UIAlertController(title: "Attention", message: "Merci de remplir le formulaire correctement", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            let myTvShow = TvShowClass(title: titleString, desc: descriptionString, picture: imageString, day_out: daySelected!, frequecy_out: frequenceSelected!, hour_alert: notificationSelected!, fav: 0)

            notificationString.removeSubrange(notificationString.index(notificationString.startIndex, offsetBy: 2)..<notificationString.endIndex)
            
            addLocal(myTvShow: myTvShow, hourNotif: Int(notificationString)!)

        }
    }
    
    @IBAction func cancelTouchButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
