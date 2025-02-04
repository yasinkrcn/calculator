# Flutter Calculator App 🧮

[English](#english) | [Türkçe](#türkçe)

![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D3.27.2-blue.svg)
![Simulator Screenshot - iPhone 16 - 2025-02-04 at 08 56 14]()


<div align="center">
  <img src="[https://via.placeholder.com/300x600?text=Resim+1](https://github.com/user-attachments/assets/f265ed0e-fbb2-47e6-a7d9-8c120efee3cd](https://github.com/user-attachments/assets/2a39be71-7ba7-4ecf-b61f-4bb31174cd46)" alt="Resim 1" width="300" style="margin-right: 10px;">
  <img src="https://via.placeholder.com/300x600?text=Resim+2](https://github.com/user-attachments/assets/9e14e78f-acad-4434-887e-601134683add" alt="Resim 2" width="300">
</div>

---

## English

A modern, feature-rich calculator application built with Flutter, featuring a clean design and advanced calculation capabilities.

### ✨ Features

- 🎨 Modern and clean UI design
- 🌓 Dark and light theme support
- 🧮 Advanced calculation capabilities
- 💯 Percentage calculations
- 🔢 Decimal number support
- ⚡ Real-time calculation
- 📱 Responsive design

### 🎯 Key Features

- Basic arithmetic operations (×, ÷, +, -)
- Percentage calculations
- Continuous operations
- Error handling
- Automatic decimal formatting
- Smooth animations
- Theme switching

### 🛠️ Installation

1. Clone the repository
```bash
git clone https://github.com/yasinkrcn/calculator.git
```

2. Navigate to project directory
```bash
cd calculator
```

3. Get dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

### 📱 Usage

The calculator supports various calculation scenarios:

```
Basic Operations:
8 + 9 = 17
12 × 3 = 36

Percentage Calculations:
100 + 10% = 110
50% of 200 = 100

Continuous Operations:
10 + 5 = 15 × 2 = 30
```

### 🏗️ Project Structure

```
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   ├── constants/
│   │   └── app_constants.dart
│   └── extensions/
│       └── string_extensions.dart
├── features/
│   └── calculator/
│       ├── models/                
│       │   └── calculator_model.dart
│       ├── services/            
│       │   └── calculator_service.dart
│       ├── view_models/          
│       │   └── calculator_view_model.dart
│       └── views/                
│           ├── calculator_page.dart
│           └── widgets/
│               ├── calculator_display.dart
│               └── calculator_key_button.dart
│               └── theme_toggle.dart
└── main.dart
```

---

## Türkçe

Flutter ile geliştirilmiş, modern tasarıma ve gelişmiş hesaplama özelliklerine sahip bir hesap makinesi uygulaması.

### ✨ Özellikler

- 🎨 Modern ve temiz kullanıcı arayüzü
- 🌓 Karanlık ve aydınlık tema desteği
- 🧮 Gelişmiş hesaplama özellikleri
- 💯 Yüzde hesaplamaları
- 🔢 Ondalık sayı desteği
- ⚡ Gerçek zamanlı hesaplama
- 📱 Duyarlı tasarım

### 🎯 Temel Özellikler

- Temel aritmetik işlemler (×, ÷, +, -)
- Yüzde hesaplamaları
- Zincirleme işlemler
- Hata yönetimi
- Otomatik ondalık formatı
- Akıcı animasyonlar
- Tema değiştirme

### 🛠️ Kurulum

1. Projeyi klonlayın
```bash
git clone https://github.com/yasinkrcn/calculator.git
```

2. Proje dizinine gidin
```bash
cd calculator
```

3. Bağımlılıkları yükleyin
```bash
flutter pub get
```

4. Uygulamayı çalıştırın
```bash
flutter run
```

### 📱 Kullanım

Hesap makinesi çeşitli hesaplama senaryolarını destekler:

```
Temel İşlemler:
8 + 9 = 17
12 × 3 = 36

Yüzde Hesaplamaları:
100 + %10 = 110
200'ün %50'si = 100

Zincirleme İşlemler:
10 + 5 = 15 × 2 = 30
```

### 🏗️ Proje Yapısı

```
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   ├── constants/
│   │   └── app_constants.dart
│   └── extensions/
│       └── string_extensions.dart
│   └── init/
│       └── injection_container.dart
│       └── providers.dart
│       └── startup_manager.dart
├── features/
│   └── calculator/
│       ├── models/                
│       │   └── calculator_model.dart
│       ├── services/            
│       │   └── calculator_service.dart
│       ├── view_models/          
│       │   └── calculator_view_model.dart
│       └── views/                
│           ├── calculator_page.dart
│           └── widgets/
│               ├── calculator_display.dart
│               └── calculator_key_button.dart
│               └── theme_toggle.dart
└── main.dart
```
