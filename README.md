# 🚀 Roqqu Mobile Developer Assessment

This Flutter application was built as part of the **Roqqu Mobile Developer Assessment**, implementing real-time market data and UI features inspired by the Figma design shared in the brief.

---

## 📱 App Demo

🎥 **Live Preview (Appetize):** [Appetize Link Here]  


https://github.com/user-attachments/assets/771d5637-8a2b-4656-8111-bd85d72d8a43


🖼️ **Screenshots:**
| Dashboard | Copy Trading | Trader Detail |
|------------|--------------|----------------|
![crypto_app_roqqu4](https://github.com/user-attachments/assets/378a0224-c407-4e56-b756-2accfcfb4513)
![crypto_app_roqqu3](https://github.com/user-attachments/assets/522c25eb-119c-4b13-98f0-2fe92c62ab3b)
![crypto_app_roqqu1](https://github.com/user-attachments/assets/db1fee27-a509-4f19-b2a7-4845652dfc82)

apk link
https://drive.google.com/file/d/1Thwp54qdx3K9sUWmQL4evNZcd9uhPShb/view?usp=sharing

---

## 🧩 Features Implemented

- Accurate UI implementation following the Figma design  
- Smooth animations and transitions  
- Real-time WebSocket data integration (using mock data for now)  
- Modular MVVM architecture with **Stacked**  
- Navigation and reactivity handled cleanly  
- Custom dialogs, overlays, and popups  
- Responsive and adaptive layouts  
- Organized folder structure for scalability  

---

## ⚙️ Tech Stack

- **Framework:** Flutter (3.x)
- **Architecture:** MVVM (Stacked)
- **State Management:** Stacked ViewModel
- **Networking:** WebSocket + HTTP (mocked)
- **Design System:** Custom typography, theme, and component-based structure
- **Testing:** Manual UI validation (unit tests planned)

---


---

## 🧠 Architecture Overview

This project follows the **Stacked architecture** (MVVM pattern):
- **ViewModels** contain all logic.
- **Services** handle API, storage, and bottom sheet interactions.
- **Views** are pure UI, free from business logic.
- Navigation handled via `StackedRouter`.

---

## 🔧 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/roqqu_assessment.git
   flutter pub get
   flutter run
   


