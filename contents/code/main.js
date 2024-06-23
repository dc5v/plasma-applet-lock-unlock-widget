function checkLockStatus() {
  plasmoid.executeCommand("kreadconfig5", ["--file", "~/.config/kdeglobals", "--group", "KDE Action Restrictions", "--key", "plasma/plasmashell/unlockedDesktop"], function (stdout) {
    var isUnlocked = stdout.trim() === "true";
    plasmoid.emit("updateImage", isUnlocked);
  });
}

plasmoid.checkLockStatus = checkLockStatus;
plasmoid.loaded.connect(checkLockStatus);
