import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    width: 100
    height: 100

    PlasmaCore.IconItem {
        id: statusImage
        anchors.centerIn: parent
        source: "unlocked.png"
        width: 64
        height: 64
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            plasmoid.nativeInterface.checkLockStatus().then(function(isUnlocked) {
                statusImage.source = isUnlocked ? "unlocked.png" : "locked.png";
                console.log("isUnlocked: " + isUnlocked); // 디버그 로그 추가
            });
        }
    }

    Component.onCompleted: {
        plasmoid.nativeInterface.checkLockStatus().then(function(isUnlocked) {
            statusImage.source = isUnlocked ? "unlocked.png" : "locked.png";
            console.log("isUnlocked: " + isUnlocked); // 디버그 로그 추가
        });
    }
}
