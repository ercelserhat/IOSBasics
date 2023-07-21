//
//  ViewController.swift
//  Notifications
//
//  Created by Serhat on 21.07.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            self.izinKontrol = granted
            if granted{
                print("İzin alma işlemi başarılı.")
            }else{
                print("İzin alma işlemi başarısız.")
            }
        })
    }

    @IBAction func bildirimOlustur(_ sender: Any) {
        if izinKontrol{
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            //let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            var date = DateComponents()
            date.minute = 30
            date.hour = 8
            date.day = 20
            date.month = 4
            let tetikleme2 = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "Notifications", content: icerik, trigger: tetikleme2)
            
            UNUserNotificationCenter.current().add(bildirimIstegi, withCompletionHandler: nil)
        }
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
}
