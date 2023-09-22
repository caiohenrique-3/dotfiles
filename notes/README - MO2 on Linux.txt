1. (Old Method) With an AUR helper, install lib32-freetype2 (needed to run MO2) and lib32-libpulse (if not installed FNV won't detect your sound device when launching through MO2)
1. (New Method) Just install the winetricks package from the official arch repos.

2. Download the Mod Organizer executable

3. Write this on the terminal:

STEAM_COMPAT_CLIENT_INSTALL_PATH=/usr/bin/steam
STEAM_COMPAT_DATA_PATH=/mnt/HD/SteamLibrary/steamapps/compatdata/22380/
/mnt/HD/SteamLibrary/steamapps/common/Proton\ 8.0/proton run /mnt/HD/downloads/mo2.exe

4. After installing, just change the above command to run the ModOrganizer.exe (not the installer), like this:

STEAM_COMPAT_CLIENT_INSTALL_PATH=/usr/bin/steam
STEAM_COMPAT_DATA_PATH=/mnt/HD/SteamLibrary/steamapps/compatdata/22380/
/mnt/HD/SteamLibrary/steamapps/common/Proton\ 8.0/proton run /mnt/HD/SteamLibrary/steamapps/compatdata/22380/pfx/drive_c/Modding/MO2/ModOrganizer.exe

------------------------------------------------
5. EXTRA TIP FOR SKYRIM PLAYERS:

- For getting Nemesis to work in Linux, install it manually or do this:

> Install the mod normally through MO2
> Create a folder named 'Nemesis_Engine' in your game Data folder.

> ln -s "/yourpath/compatdata/489830/pfx/drive_c/Modding/MO2/mods/Nemesis Unlimited Behavior Engine" "/yourpath/steamapps/common/Skyrim Special Edition/Data/Nemesis_Engine"

