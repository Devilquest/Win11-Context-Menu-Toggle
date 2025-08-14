
# Win11 Context Menu Switcher

Switch between the **modern Windows 11 context menu** (default) and the **classic menu** using a simple `.bat` script.

> The **modern menu** is what appears by default on right-click.  
> The **classic menu** appears when you select **Show more options** or use **Shift + F10** or **Shift + right-click**.

---

## Screenshots

- **Modern (default)**  
  ![Modern context menu](https://i.imgur.com/dFfFBY6.jpeg)
  

- **Classic**  
  ![Classic context menu](https://i.imgur.com/5GSuRcK.jpeg)

---

## How it works

The script modifies the user-level registry (`HKCU`) and does not require administrator privileges.

- **Classic menu**: creates the default empty value at  
  `HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32`
- **Modern menu**: deletes the entire key  
  `HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}`

Changes apply **only to the current user**.

---

## Usage

1. Download or clone this repository.
2. Save the script as `Win11_ContextMenu_Toggle.bat`.
3. Run the file and choose:
   - `1` → Modern menu.
   - `2` → Classic menu.
4. At the end, the script will ask if you want to restart Explorer:
   - `Y` → apply the change immediately.
   - `N` → apply it later manually.

---

## Restarting Explorer manually

If you choose `N`, you can restart Explorer later by running:

```bat
taskkill /f /im explorer.exe
start explorer.exe
```

<br>

------------
## :heart:Donations
**Donations are always greatly appreciated. Thank you for your support!**

<a href="https://www.buymeacoffee.com/devilquest" target="_blank"><img src="https://i.imgur.com/RHHFQWs.png" alt="Buy Me A Dinosaur"></a>
