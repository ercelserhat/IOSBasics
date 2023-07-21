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
            let evet = UNNotificationAction(identifier: "evet", title: "Evet", options: .foreground)
            let hayir = UNNotificationAction(identifier: "hayir", title: "Hayır", options: .foreground)
            let sil = UNNotificationAction(identifier: "sil", title: "Sil", options: .destructive)
            let kategori = UNNotificationCategory(identifier: "kategori", actions: [evet, hayir, sil], intentIdentifiers: [], options: [])
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "5, 4'ten büyük mü?"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            icerik.categoryIdentifier = "kategori"
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            /*var date = DateComponents()
            date.minute = 30
            date.hour = 8
            date.day = 20
            date.month = 4
            let tetikleme2 = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
             */
            
            let bildirimIstegi = UNNotificationRequest(identifier: "Notifications", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi, withCompletionHandler: nil)
        }
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        if response.actionIdentifier == "evet"{
            print("Doğru cevap")
        }
        if response.actionIdentifier == "hayir"{
            print("Yanlış cevap")
        }
        if response.actionIdentifier == "sil"{
            print("Cevap verilmedi.")
        }
    }
}
