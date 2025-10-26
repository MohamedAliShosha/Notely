# Notely 📃
🗒️ A modern mobile app for organizing and managing your notes, featuring:
- 🧠 Quick note creation.  
- 🎨 Customizable colors.  
- 🔍 Easy edit options.

<p align="center">
  <img src="assets/screenShots/notes_all_views.png" alt="App Overview" width="800"/>
</p>


## 🎨 Views

📋 **1. Home View:**
- 📒 View all saved notes in a clean list  
- ➕ Add new notes with a floating button  
- 🗑️ Swipe to delete instantly  

<p align="left">
  <img src="assets/screenShots/notes_view.png" alt="App Overview" height="800"/>
</p>

##

📝 **2. Add Note View:**  
- 🧠 Create new notes with title & content  
- 🎨 Choose custom note color  
- 💾 Save notes locally with one tap  

<p align="left">
  <img src="assets/screenShots/add_note.png" alt="App Overview" height="800"/>
</p>

##

✏️ **3. Edit Note View:**  
- 🖋️ Edit existing notes quickly  
- 🎨 Update note color or content  
- 💾 Save changes easily  

<p align="left">
  <img src="assets/screenShots/edit_note.png" alt="App Overview" height="800"/>
</p>


## 🛠️ Tech Stack

📱 **Frontend**
- Framework: Flutter  
- State Management: Bloc (Cubit)

🧠 **Local Storage**
- Hive  

## 🏗️ Architecture
- 🧩 MVC pattern
- 💽 Local storage

```
├── assets/
│   ├── fonts/
│   └── screen_shoots/
│
└── lib/
    ├── controller/                     # 🧠 Controller layer (contains all Cubits)
    │   ├── notes_cubit/                # Logic for managing existing notes
    │   │   ├── notes_cubit.dart
    │   │   └── notes_state.dart
    │   │
    │   └── add_notes_cubit/            # Logic for adding new notes
    │       ├── add_notes_cubit.dart
    │       └── add_notes_state.dart
    │
    ├── models/                         # 💾 Model layer (data structures / entities)
    │   └── note_model.dart
    │   └── note_model.g.dart
    │ 
    ├── views/                          # 🎨 View layer (UI screens)
    │   ├── notes_view.dart
    │   ├── edit_note_view.dart
    │   └── widgets/                    # Reusable UI components for views
    │
    ├── bloc_observer.dart              # Bloc observer for debugging Cubit transitions
    ├── constants.dart                  # App constants (colors, strings, etc.)
    └── main.dart                       # App entry point
