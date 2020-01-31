//
//  AppDelegate.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import Firebase
import SwiftyStoreKit
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?


   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // Override point for customization after application launch.
      
      
      //--------------------FIREBASE-----------------------//
      print("本番のfirebaseにアクセス")
      let fileName = "GoogleService-Info"
      let filePath = Bundle.main.path(forResource: fileName, ofType: "plist")
      let fileopts = FirebaseOptions(contentsOfFile: filePath!)
      
      FirebaseApp.configure(options: fileopts!)
      GADMobileAds.sharedInstance().start(completionHandler: nil)
      //--------------------FIREBASE-----------------------//
      
      
      //--------------------STORE KIT-----------------------//
      SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
         for purchase in purchases {
            switch purchase.transaction.transactionState {
            case .purchased, .restored:
               if purchase.needsFinishTransaction {
                  SwiftyStoreKit.finishTransaction(purchase.transaction)
               }
            // Unlock content
            case .failed, .purchasing, .deferred:
               break // do nothing
            }
         }
      }
      //--------------------STORE KIT-----------------------//
      
      
      //------------------- プッシュ通知-----------------//
      // [START set_messaging_delegate]
      Messaging.messaging().delegate = self
      // [END set_messaging_delegate]
      if #available(iOS 10.0, *) {
         // For iOS 10 display notification (sent via APNS)
         UNUserNotificationCenter.current().delegate = self
         
         let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
         UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
      } else {
         let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
         application.registerUserNotificationSettings(settings)
      }
      application.registerForRemoteNotifications()
      //------------------- プッシュ通知-----------------//
      
      UIApplication.shared.applicationIconBadgeNumber = 0
      
      //------------------- OpenCount-----------------//
      UserDefaults.standard.register(defaults:["openCount": 0])
      let openCount = UserDefaults.standard.integer(forKey: "openCount")
      UserDefaults.standard.set(openCount + 1, forKey: "openCount")
      print("起動回数 = \(UserDefaults.standard.integer(forKey: "openCount"))")
      //------------------- OpenCount-----------------//
      
      return true
   }

   //MARK:- 元々あったやつ
   func applicationWillResignActive(_ application: UIApplication) {
      // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
      // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
   }

   func applicationDidEnterBackground(_ application: UIApplication) {
      // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
      // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   }

   func applicationWillEnterForeground(_ application: UIApplication) {
      // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   }

   func applicationDidBecomeActive(_ application: UIApplication) {
      // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   }

   func applicationWillTerminate(_ application: UIApplication) {
      // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   }
   //MARK: 元々あったやつ -

   
   
   //MARK: 通知のデリゲート
   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
      //アプリがバックグラウンドにある間に通知メッセージを受信した場合
      //このコールバックは、ユーザーがアプリケーションを起動する通知をタップするまで起動されません。
      // TODO: 通知データを扱う
      
      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)
      
      // Print message ID.
      if let messageID = userInfo["gcm.message_id"] {
         print("Message ID: \(messageID)")
      }
      
      // Print full message.
      print(userInfo)
   }
   
   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      //アプリがバックグラウンドにある間に通知メッセージを受信した場合
      //このコールバックは、ユーザーがアプリケーションを起動する通知をタップするまで起動されません。
      // TODO: 通知データを扱う
      
      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)
      
      // Print message ID.
      if let messageID = userInfo["gcm.message_id"] {
         print("メッセージID: \(messageID)")
      }
      
      // Print full message.
      print(userInfo)
      
      completionHandler(UIBackgroundFetchResult.newData)
   }
   
}


@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
   func userNotificationCenter(_ center: UNUserNotificationCenter,
                               willPresent notification: UNNotification,
                               withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      let userInfo = notification.request.content.userInfo
      
      if let messageID = userInfo["gcm.message_id"] {
         print("メッセージID: \(messageID)")
      }
      
      print(userInfo)
      
      completionHandler([])
   }
   
   func userNotificationCenter(_ center: UNUserNotificationCenter,
                               didReceive response: UNNotificationResponse,
                               withCompletionHandler completionHandler: @escaping () -> Void) {
      let userInfo = response.notification.request.content.userInfo
      if let messageID = userInfo["gcm.message_id"] {
         print("メッセージID: \(messageID)")
      }
      
      print(userInfo)
      
      completionHandler()
   }
}

extension AppDelegate : MessagingDelegate {
   //MARK:- START refresh_token
   func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
      print("Firebase registration token: \(fcmToken)")
      
      let dataDict:[String: String] = ["token": fcmToken]
      NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
      // TODO: 必要に応じてトークンをアプリケーションサーバーに送信します。
      // Note: このコールバックは、アプリの起動時と新しいトークンが生成されるたびに発生します。
   }
   //MARK: END refresh_token -
   
   //MARK:- START ios_10_data_message
   // アプリがフォアグラウンドにあるときに、iOS 10以降でデータメッセージをFCMから直接（APNをバイパスして）受信する。
   // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
   func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
      print("レシーブデータメッセージ: \(remoteMessage.appData)")
   }
   //MARK: END ios_10_data_message -
}
