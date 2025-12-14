# 🚀 NASA APOD iOS App

An iOS application built with **SwiftUI** that displays NASA’s **Astronomy Picture of the Day (APOD)** using NASA’s public API.  
This project was developed as part of an iOS technical assessment, focusing on clean architecture, modern Swift practices, and a polished user experience.

---

## 📱 Features

### ✅ Core Features
- Fetches NASA’s Astronomy Picture of the Day using REST API
- Displays:
  - Title
  - High-quality image
  - Explanation/description
  - Date
  - Copyright (if available)
- Date picker to view APODs from previous dates
- Valid date handling (1995-06-16 → today)
- Full-screen image viewer with **pinch-to-zoom**
- Loading indicators and user-friendly error handling
- Retry option on network failure

---

## 🧱 Architecture

The app follows **MVVM (Model-View-ViewModel)** architecture for clean separation of concerns.


### Technologies Used
- SwiftUI
- Async/Await networking
- URLSession
- MVVM architecture
- iOS Simulator & device testing

---

## 🌐 API Reference


GET https://api.nasa.gov/planetary/apod


**Query Parameters**
- `api_key` (required)
- `date` (optional, YYYY-MM-DD)
- `hd` (optional)

The app uses NASA’s public **DEMO_KEY** by default.

---

## ▶️ How to Run the App

1. Clone the repository:
  
   ```bash https://github.com/HAFFIC001/APODApp

Open the project:

bash
Copy code
open APODApp.xcodeproj
Select an iOS Simulator (e.g., iPhone 15 / 16 Pro)

Run the app:

Click ▶️ Run

🧪 Error Handling

Network failure handling

Invalid API response handling

Invalid date selection prevention

Graceful empty/missing content handling

🌙 Dark Mode

The app supports Dark Mode automatically via SwiftUI.

🔮 Possible Enhancements

(Not implemented but easy to extend)

Image caching

Favorites (local persistence)

Share APOD image

Search by date range

Unit tests for ViewModels

👨‍💻 Author

Aryan Gupta
iOS Developer
Swift | SwiftUI | MVVM | Clean Architecture

📄 License

This project is for assessment and educational purposes only.
