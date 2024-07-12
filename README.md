# Tic Tac Toe Multiplayer Game

## Overview
The Tic Tac Toe Multiplayer Game is a mobile application that allows users to play Tic Tac Toe with friends in real-time. It features a smooth and intuitive user interface, real-time game updates using Firebase, and secure Google Sign-In for authentication.

## Features
- Real-time multiplayer gameplay
- Google Sign-In for authentication
- Smooth and intuitive user interface
- State management with GetX
- Responsive design for both iOS and Android

## Screenshots
<table>
  <tr align="center">
     <td>Start Page</td>
     <td>Login Board</td>
     <td>Home Page</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/bdacd992-d7ec-4b17-b9cb-58fa8fa57766"></td>
    <td><img src="https://github.com/user-attachments/assets/46a12ad9-f04f-430d-86cf-fbc1b76a464b"></td>
    <td><img src="https://github.com/user-attachments/assets/12da63b0-6ab4-48aa-a9c5-07f5d4a467fa"></td>
  </tr>
</table>
<table>
  <tr align="center">
     <td>Single Player</td>
     <td>Room Page</td>
     <td>Multiplayer</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8c48584a-3f3b-4d98-88ea-def118bd04b1"></td>
    <td><img src="https://github.com/user-attachments/assets/cbb5fe7b-5cc7-4a1e-8c8b-841f792a37e9"></td>
    <td><img src="https://github.com/user-attachments/assets/5dca207c-1932-4906-8109-e64664abd713"></td>
  </tr>
</table>

## Installation

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- An editor like Android Studio or Visual Studio Code

### Steps
1. Clone the repository:
    ```sh
    git clone https://github.com/HK-Gupta/MP_Tic_Tak_Toe.git
    ```
2. Navigate to the project directory:
    ```sh
    cd tic-tac-toe-multiplayer
    ```
3. Get the dependencies:
    ```sh
    flutter pub get
    ```
4. Set up Firebase:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Firebase Realtime Database
   - Enable Google Sign-In in the Authentication section
   - Download the `google-services.json` file and place it in the `android/app` directory

5. Run the app:
    ```sh
    flutter run
    ```

## Usage
1. Sign in with Google.
2. Start a game and invite a friend or join an existing game.
3. Play Tic Tac Toe in real-time with smooth and responsive UI.

## Contributing
Contributions are welcome! Please fork this repository and submit a pull request for any bug fixes or feature enhancements.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
- [Firebase](https://firebase.google.com/) for providing backend services
- [Flutter](https://flutter.dev/) team for the awesome framework
