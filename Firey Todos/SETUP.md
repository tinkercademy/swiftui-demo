# Firey Todos Set-Up
1. Create a Firebase project
2. Connect an iOS App to it
3. Download the GoogleService-Info.plist 
4. Import the GoogleService-Info.plist to the project
5. Under **Authentication**, enable **Email/Password** authentication
6. Under **Realtime Databases**, press **New**
7. Set the location to **Singapore**
8. Set it up with the rules below
```json
{
  "rules": {
    ".read": "auth.uid != null",
    ".write": "auth.uid != null"
  }
}
```
9. Save it
10. Run the project