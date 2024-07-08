import QtQuick
import QtQuick.Controls
import QtMultimedia
ApplicationWindow {
    visible: true
    width: 400
    height: 200

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Play MP3"
            onClicked: {
                audioPlayer.play()
                console.log("AudioPlayer State:", audioPlayer.playbackState)
                console.log("AudioPlayer Error:", audioPlayer.errorString)
            }
        }

        Button {
            text: "Pause"
            onClicked: audioPlayer.pause()
        }

        Button {
            text: "Stop"
            onClicked: audioPlayer.stop()
        }
    }

    MediaPlayer {
        id: audioPlayer
        // load source from user's Downloads directory on macOS
        source: "file:///Users/$USER/Downloads/sample.mp3"
        onPlaybackStateChanged: console.log("AudioPlayer State Changed:", playbackState)
        onErrorChanged: console.log("AudioPlayer Error:", errorString)
        audioOutput: AudioOutput {
            muted: false
            volume: 1
        }
    }
}
