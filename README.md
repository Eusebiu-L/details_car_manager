<div align="center">

# 🚗 **Car Reminder App**

</div>

**Car Reminder App** transformă dilema administrativă „Când îmi expiră asigurarea?" într-o experiență organizată și liniștitoare. Dezvoltată în Flutter, aplicația combină un design intuitiv cu funcționalitate robustă pentru a-ți oferi pace sufletească prin monitorizare inteligentă a documentelor vehiculului.

✨ **Experiența Utilizatorului**

Aplicația este construită în jurul a trei piloni fundamentali: Simplitate, Claritate și Eficiență.

🎯 **Dashboard Imediat**: Vizualizare rapidă a tuturor mașinilor și stării documentelor cu sistem semaphor (verde/galben/roșu).
📝 **Gestiune Completă**: Adaugă, editează și șterge mașini cu dialog-uri intuitive și calendar integrat.
🔔 **Alerte Inteligente**: Notificări cu 7 zile înainte de expirare pentru a evita amenzi și probleme legale.
🎨 **Design Modern**: Interfață bazată pe Material Design 3, cu paletă purpurie (Purple[700]) care inspiră încredere și profesionalism.

---

## 🏗️ Arhitectura Proiectului

Codul este organizat modular pentru a respecta bunele practici de dezvoltare:

```
lib/
├── 📱 main.dart              # Punctul de lansare & Tema aplicației
├── 📦 models/
│   └── car.dart              # Model pentru vehicul
├── 💾 services/
│   └── car_service.dart      # Business logic și date inițiale
├── 🎨 constants/
│   └── app_colors.dart       # Paletă centralizată de culori
├── 🧮 utils/
│   └── date_utils.dart       # Helper-e pentru calcule de date
├── 🧩 widgets/               # Componente reutilizabile
│   ├── cars_list_view.dart
│   ├── dialogs/
│   ├── tiles/
│   └── sections/
└── 🖼️ screens/               # Ecranele principale
    ├── home_screen.dart
    └── car_details_screen.dart
```

---

## 🛠️ Detalii Tehnice de Implementare

| **Caracteristică** | **Tehnologie / Widget Utilizat** |
|-------------------|----------------------------------|
| **State Management** | StatefulWidget cu setState pentru actualizări UI |
| **Navigare** | Navigator.push cu tranziții native |
| **Layout** | Column, Row, ListView pentru structura responsive |
| **Calcule Date** | Logică locală pentru detectare expirare și warning-uri |
| **Color System** | AppColors cu constante centralizate (Purple, Green, Red, Yellow) |
| **Animații** | ScaleTransition pe butoane, transițiile native Flutter |
| **UI Kit** | Material Design 3, Card-uri elevate, Dialog-uri native |

---

## 📋 Documente Monitorizate

Aplicația vine pre-configurată cu **4 vehicule de test**:

| # | Vehicul | Status Inițial | Documente | 
|---|---------|---|---|
| 1. | Toyota | 🔴 Expirat | ITP expirat |
| 2. | BMW X5 | 🟡 Warning | Asigurare în 7 zile |
| 3. | Audi | 🟢 Valid | Toate în regulă |
| 4. | Golf | 🟢 Valid | Toate în regulă |

Fiecare vehicul monitorizează:
- **Asigurare RCA/CASCO** - Anuală
- **ITP (Inspecția Tehnică)** - 1-2 ani
- **Rovinietă** - Anuală

---

## 🚀 Instalare și Rulare

### 📋 Pași de Instalare

**1.** Clonează repository-ul

**2.** Verifică integritatea mediului:
```bash
flutter doctor
```

**3.** Instalează dependențele:
```bash
flutter pub get
```

**4.** Lansează în simulator/device:
```bash
flutter run
```

---

## 📱 Platforme Suportate

| | Platformă | Suport |
|---|-----------|--------|
| 📱 | **Mobile** | iOS & Android (Interfață adaptivă) |
| 🌐 | **Web** | Optimizat pentru Chrome/Safari/Edge |
| 💻 | **Desktop** | Windows & macOS (Layout centrat) |

---

## 📸 Capturi de Ecran

| Ecran Principal | Detalii Mașină | Editare Document |
|---|---|---|
| ![Home Screen](lib/screenshots/Home_screen.png) | ![Car Details](lib/screenshots/car_details.png) | ![Edit](lib/screenshots/edit_car_details.png) |
| Lista mașini cu status | Documente vehicul | Selectare dată expirare |

---
