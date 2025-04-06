# iAR

**iAR** is an iOS application that brings interactive Augmented Reality (AR) experiences to life. Users can place and interact with realistic 3D objects—like lamps, chairs, candles, cups, and more—directly in their physical environment using ARKit and RealityKit.

## 🚀 Features

- 📦 **3D Object Placement**: Choose from a set of predefined objects such as:
  - Candle 🕯️
  - Cup ☕
  - Vase 🌼
  - Lamp 💡
  - Chair 🪑

- 📐 **Surface Detection**: Detects horizontal surfaces for accurate object placement.
  
- 🧭 **Object Interaction**:
  - Tap to place
  - **Pinch to resize**
  - **Rotate using two-finger gesture**
  - Drag to move

- ⚙️ **Options Menu**:
  - Toggle light estimation
  - Enable/disable debug visualization
  - Switch between 3DOF and 6DOF tracking

---

## 🛠️ Built With

- **Swift**
- **ARKit** – Apple’s framework for building AR experiences
- **RealityKit** – For rendering and handling 3D interactions

---

## 📂 Project Structure

```
iAR/
├── Assets.xcassets/
├── Models/               # 3D models for rendering
├── Views/                # UI Elements and ViewControllers
├── AppDelegate.swift
├── SceneDelegate.swift
└── Info.plist
```

---

## 🧑‍💻 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/OmSingh2003/iAR.git
   cd iAR
   ```

2. Open `iAR.xcodeproj` in Xcode

3. Make sure you run the app on a **real device** (ARKit does not work in the simulator)

4. Grant necessary camera permissions when prompted

---

## 📸 Requirements

- iPhone with ARKit support (iPhone 8 and above)
- iOS 14.0+
- Xcode 12+

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

MIT

---

## 💡 Future Plans

- Add support for custom 3D model imports
- Include object animations
- Enable object physics (gravity, collisions)
- Record and export AR videos

---

## 📬 Contact

Created by [Om Singh](https://github.com/OmSingh2003) — feel free to reach out for collaborations or suggestions!
