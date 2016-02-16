import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

    Image {
        id : img1
    }

    ColumnLayout {
        spacing: 2

        // Relative Url, loads from qrc (where this file is placed)
        Button {
            text: "Load foo.png"
            onClicked: {
                img1.source = "foo.png"
            }
        }
        
        // Absolute url, loads from network
        Button {
            text: "Load http://localhost:8000/foo.png"
            onClicked: {
                img1.source = "http://localhost:8000/foo.png"
            }
        }

        // Relative url, loads from network relative to the host page
        Button {
            text: "Load http:foo.png"
            onClicked: {
                img1.source = "http:foo.png"
            }
        }

        // Relative url, loads from network relative to the web root
        Button {
            text: "Load http:/foo.png"
            onClicked: {
                img1.source = "http:/foo.png"
            }
        }
    }
}
