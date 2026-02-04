# AuthAndStore

A simple iOS app built with **SwiftUI**, **Observation framework**, and **Firebase** using **Swift Package Manager (SPM)**.
The app demonstrates authentication, user profile handling, and basic Firestore / Storage integration.

---

## ✨ Features

* SwiftUI (iOS 17+)
* Observation framework (`@Observable`, `@State`, `@Bindable`)
* Firebase Authentication
* Firestore database
* Firebase Storage
* Swift Package Manager (no CocoaPods)

---

## 🛠 Requirements

* Xcode 15+
* iOS 17+
* Swift 5.9+
* A Firebase project

---

## 🔥 Firebase Setup (Required)

This project **does not include** Firebase configuration files for security reasons.

### 1️⃣ Create a Firebase project

* Go to [https://console.firebase.google.com](https://console.firebase.google.com)
* Create a new project
* Add an **iOS app** to the project
* Use your app’s **Bundle Identifier**

---

### 2️⃣ Download Firebase config file

Download the file:

```
GoogleService-Info.plist
```

⚠️ This file is **ignored by git** and must be added manually.

---

### 3️⃣ Add config file to Xcode

1. Drag `GoogleService-Info.plist` into Xcode
2. Make sure **Copy items if needed** is checked
3. Add it to the main app target

---

### 4️⃣ Firebase SDKs used

The following Firebase products are added via **Swift Package Manager**:

* FirebaseAuth
* FirebaseFirestore
* FirebaseStorage

No manual installation is required — Xcode resolves them automatically.

---

## 🚀 Getting Started

1. Clone the repository

   ```bash
   git clone <repo-url>
   ```

2. Open the project in Xcode

   ```bash
   open AuthAndStore.xcodeproj
   ```

3. Add your `GoogleService-Info.plist`

4. Build & run ▶️

---

## 🔐 Security Notes

* `GoogleService-Info.plist` is intentionally excluded from version control
* Do NOT commit Firebase credentials
* Firestore rules should be configured in the Firebase Console

---

## 📁 .gitignore (Important)

The project ignores:

```gitignore
DerivedData/
xcuserdata/
.build/
Package.resolved
GoogleService-Info.plist
.DS_Store
```

---

## 🧠 Architecture Notes

* App-wide state is managed via a shared ViewModel
* Views use `@State` for ownership and `@Bindable` for mutation
* Navigation is handled with `NavigationStack`

---

## 🧪 Development Notes

* Designed as a **solo project**
* Dependency versions are not locked (`Package.resolved` ignored)
* Optimized for clarity over complexity

---

## 📜 License

This project is for learning and experimentation purposes.

---

## 🙌 Acknowledgements

* SwiftUI & Observation framework
* Firebase iOS SDK
* Apple Developer Documentation
