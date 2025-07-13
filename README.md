# Suitmedia Test

A Flutter mobile app built with GetX for state management, based on the Suitmedia test case.

## 📱 Features

### 🔤 First Screen (Palindrome Checker)
- Input field for user's **name**
- Input field to check **palindrome sentence**
- "CHECK" button:
  - Shows a dialog if the sentence is a palindrome or not
- "NEXT" button:
  - Navigates to the second screen and passes the entered name

### 👋 Second Screen (User Greeting)
- Displays static "Welcome" text
- Shows:
  - Entered user name
  - Selected user name (from user list)
- "CHOOSE A USER" button:
  - Navigates to third screen to select user

### 👤 Third Screen (User List)
- Fetches user list from [https://reqres.in/api/users](https://reqres.in/api/users)
- Supports:
  - Pull to refresh
  - Infinite scroll pagination
  - Empty state handling
- Select a user:
  - Automatically updates the selected name on the second screen

## 🧰 Tech Stack

- [Flutter 3.32+](https://docs.flutter.dev/)
- [GetX](https://pub.dev/packages/get)
- [HTTP](https://pub.dev/packages/http)

## 📦 How to Run

1. **Clone this repo**
```bash
git clone https://github.com/yourusername/suitmedia_rosa.git
cd suitmedia_rosa
