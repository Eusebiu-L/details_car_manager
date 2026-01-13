# Car Reminder App

O aplicație Flutter simplă și elegantă pentru gestionarea reminder-urilor de mașini (asigurare, ITP, rovinietă).

## 📁 Structura Proiectului

```
lib/
├── main.dart                    # Punct de intrare al aplicației
├── models/
│   └── car.dart                # Model de date pentru mașini
├── screens/
│   ├── home_screen.dart         # Ecranul principal (StatefulWidget)
│   └── car_details_screen.dart  # Ecranul de detalii (StatelessWidget)
└── widgets/
    └── reminder_tile.dart       # Widget personalizat pentru reminder-uri

assets/
└── images/
    ├── car1.svg
    ├── car2.svg
    ├── car3.svg
    └── car4.svg
```

## 🎯 Caracteristici Principale

### 1. **HomeScreen (StatefulWidget)**
   - Afișează o listă scrollabilă cu toate mașinile
   - Conține datele hardcodate cu 4 mașini de exemplu
   - Afișează indicatori de avertizare pentru documente expirate
   - Permite navigarea către detaliile fiecărei mașini
   - Pune în evidență mașinile cu documente expirate

### 2. **CarDetailsScreen (StatelessWidget)**
   - Afișează imagine SVG a mașinii
   - Arată detaliile complete ale mașinii
   - Afișează 3 reminder-uri folosind widget-ul `ReminderTile`:
     - Asigurare Auto (Shield icon)
     - ITP - Inspecție Tehnică (Build icon)
     - Rovinietă (Parking icon)
   - Secție de rezumat cu datele de expirare

### 3. **ReminderTile (StatelessWidget)**
   - Widget personalizat care primește:
     - Titlu (String)
     - Data expirării (DateTime)
     - Icon (IconData)
   - **Colorează fundalul:**
     - 🟢 Verde dacă documentul este valabil
     - 🔴 Roșu dacă documentul este expirat
   - Afișează status "VALID" sau "EXPIRED"

### 4. **Car Model**
   - Proprietăți: `id`, `name`, `imagePath`, `insuranceExpiry`, `itpExpiry`, `rovignetteExpiry`
   - Datele sunt hardcodate în `HomeScreen`

## 🚀 Cum se Rulează

```bash
# Instalare dependințe
flutter pub get

# Rulare aplicație
flutter run
```

## 📦 Dependințe

- `flutter`: SDK Flutter
- `flutter_svg`: ^2.0.0 - pentru afișarea imaginilor SVG

## 🎨 Designul UI

- **Culori principale:** Albastru (#2196F3) pentru AppBar
- **Indicatori:** Verde pentru valid, Roșu pentru expirat
- **Layout:** Material Design 3
- **Componente:** Column, Row, Container, Icon, Text, ListView, Card

## ✅ Cerințe Implementate

- ✅ 2 ecrane (HomeScreen și CarDetailsScreen)
- ✅ Datele mașinilor sunt hardcodate local
- ✅ Fiecare mașină are imagine, nume, și 3 date de expirare
- ✅ ListView scrollabil cu navigare Navigator.push
- ✅ Afișare imagini mașinilor și detalii
- ✅ Widget ReminderTile personalizat cu colorare (verde/roșu)
- ✅ StatefulWidget (HomeScreen) și StatelessWidget (CarDetailsScreen)
- ✅ Structura clară și organizată
