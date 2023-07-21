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
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "Notifications", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi, withCompletionHandler: nil)
        }
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
}
