//
//  NatificationHelper.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 04.10.2020.
//


import UIKit
import UserNotifications

final class Notifications: NSObject, UNUserNotificationCenterDelegate {

    let notificationCenter = UNUserNotificationCenter.current()

    func userRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]

        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }

    func scheduleNotification(notificationType: String) {

        let content = UNMutableNotificationContent() // Содержимое уведомления
        let userActions = "User Actions"

        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userActions

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }

        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])

        notificationCenter.setNotificationCategories([category])
    }


    public func notificationSettings(date: Date) {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in

            guard granted else { return }
            self.notificationCenter.getNotificationSettings { (settings) in
                print(settings)
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
        notificationCenter.delegate = self
        sendNotification(date: date)
    }

    private func sendNotification(date: Date) {
        let date = date
        let content = UNMutableNotificationContent()
        let userActions = "Действия пользователя"

        content.title = "Просмотрите аудио заметку"
        content.body = "Важное дело 🙊"
        content.sound = .default
        content.categoryIdentifier = userActions

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date) //log ▿ year: 2020 month: 04 day: 11 hour: 21 minute: 16 second: 0 isLeapMonth: false
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: { (error) in
            if let error = error {
                // Something went wrong
                print(error)
            }
        })

        let openAction = UNNotificationAction(identifier: "Открыть", title: "Открыть", options: [])
        let deleteAction = UNNotificationAction(identifier: "Удалить", title: "Удалить", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions,
                                              actions: [openAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])

        notificationCenter.setNotificationCategories([category])
    }


    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        completionHandler([.alert,.sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {

        switch response.actionIdentifier {
        case "Удалить":
            print("Delete")
        default:
            print("Открыть")
        }

        completionHandler()
    }
}

