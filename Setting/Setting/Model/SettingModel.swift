//
//  SettingModel.swift
//  Setting
//
//  Created by Darshan Dangar on 03/08/23.
//

import UIKit

struct SettingModel {
    let image: String?
    let name: String
    
    static let listOfSettingIteams: [String: [SettingModel]] = [
        "Section1": [
            SettingModel(image: "", name: "Apple Arcade Free for 3 Mnths")
        ],
        "Section2": [
            SettingModel(image: "airplane_mode", name: "Airplane Mode"),
            SettingModel(image: "wifi", name: "Wi-Fi"),
            SettingModel(image: "bluetooth", name: "Bluetooth"),
            SettingModel(image: "mobile_data", name: "Mobile Data")
        ],
        "Section3": [
            SettingModel(image: "notification", name: "Notifications"),
            SettingModel(image: "audio_speaker_on", name: "Sounds & Haptics"),
            SettingModel(image: "focus", name: "Focus"),
            SettingModel(image: "timer", name: "Screen Time")
        ],
        "Section4": [
            SettingModel(image: "settings", name: "General"),
            SettingModel(image: "control_center", name: "Control Centre"),
            SettingModel(image: nil, name: "Display & Brightness"),
            SettingModel(image: "home", name: "Home Screen"),
            SettingModel(image: "accessibility", name: "Accessibility"),
            SettingModel(image: "wallpaper", name: "Wallpaper"),
            SettingModel(image: "siri", name: "Siri & Search"),
            SettingModel(image: "face_id", name: "Face ID & Passcode"),
            SettingModel(image: "sos", name: "Emergency SOS"),
            SettingModel(image: "brightness_low", name: "Exposure Notifications"),
            SettingModel(image: "full_battery", name: "Battery"),
            SettingModel(image: "palm_of_hand", name: "Privacy & Security")
        ],
        "Section5": [
            SettingModel(image: "app_store", name: "App Store"),
            SettingModel(image: "wallet", name: "Wallet")
        ],
        "Section6": [
            SettingModel(image: "password", name: "Passwords"),
            SettingModel(image: "email", name: "Mail"),
            SettingModel(image: "contact", name: "Contacts"),
            SettingModel(image: "calendar", name: "Calendar"),
            SettingModel(image: "notes", name: "Notes"),
            SettingModel(image: "reminder", name: "Reminders"),
            SettingModel(image: "abstract_shape", name: "Freeform"),
            SettingModel(image: nil, name: "Voice Memos"),
            SettingModel(image: "telephone", name: "Phone"),
            SettingModel(image: "messages", name: "Messages"),
            SettingModel(image: "face_time", name: "FaceTime"),
            SettingModel(image: "safari", name: "Safari"),
            SettingModel(image: "cloudy", name: "Weather"),
            SettingModel(image: "translating", name: "Translate"),
            SettingModel(image: "google_maps", name: "Maps"),
            SettingModel(image: "compass", name: "Compass"),
            SettingModel(image: "measure", name: "Measure"),
            SettingModel(image: "shortcut_script_app", name: "Shortcuts"),
            SettingModel(image: "healthcare", name: "Health")
        ],
        "Section7": [
            SettingModel(image: "musical", name: "Music"),
            SettingModel(image: "apple_tv", name: "TV"),
            SettingModel(image: "photos", name: "Photos"),
            SettingModel(image: "photo_camera", name: "Camera"),
            SettingModel(image: "open_book", name: "Books"),
            SettingModel(image: "podcasts", name: "Podcasts"),
            SettingModel(image: "game_center", name: "Game Center")
        ],
        "Section8": [
            SettingModel(image: "tv_provider", name: "TV Provider")
        ],
        "Section9": [
            SettingModel(image: "hammer", name: "Developer")
        ],
        "Section10": [
            SettingModel(image: nil, name: "AbcToGo"),
            SettingModel(image: nil, name: "AppsHive"),
            SettingModel(image: nil, name: "Asistee Company"),
            SettingModel(image: nil, name: "Asistee Service Provider"),
            SettingModel(image: nil, name: "BeautyBook"),
            SettingModel(image: nil, name: "Blackbird Smart Wristband"),
            SettingModel(image: nil, name: "Help Lah - Hire Service"),
            SettingModel(image: "skype", name: "Skype"),
            SettingModel(image: nil, name: "SpeechRecognitionDemo"),
            SettingModel(image: nil, name: "TaxiCustomer"),
            SettingModel(image: nil, name: "TestFlight"),
            SettingModel(image: nil, name: "Truth Radio"),
            SettingModel(image: nil, name: "Ts. STAFF"),
        ]
    ]
}
