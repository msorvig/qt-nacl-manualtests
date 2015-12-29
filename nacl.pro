TEMPLATE = subdirs

# The test are ordered roughly in order of complexity, and separated into
# three sets: cross-platform, nacl, and emscripten, where emscripten is
# a (limited)variant of nacl. The intetion is to keep the top-level build
# error free for all three cases.

nacl {
    SUBDIRS += \
        qmake_cpp\                      # C++ hello world built by qmake
#        qmake_qtcore\                   # QtCore hello world built by qmake
        qmake_ppapi \                   # build a standard ppapi "hello world" example with qmake.
        qtcore \                        # Pppapi and  simple QtCore usage (qstring).
        qtcore_main \                   # implement main and use QtCore
        qtcore_network \                # QNetworkAccessManager on main and worker threads.
        clipboard \                     # test javascript clipboard events
        resources \                     # test the qrc resources system
        urlload \                       # test url loading
        prototype_main \                # qt_main app startup prototype.
        prototype_openglfucntions \     # resolving opengl functions prototyping.
        worker_thread                   # Test the Qt event dispatcher on a worker thread.

    !emscripten {
        SUBDIRS += \
            prototype_libppapimain \    # call PpapiPluginMain from a shared library.
            window_appmodule \          # App-defined pp::CreateModule()
    }
}

# cross-platform
SUBDIRS += \
    window_raster \                     # QWindow with raster graphics.
    window_opengl \                     # QWindow with OpenGL graphics.
    window_widgets \                    # QWidget

    !emscripten {
        SUBDIRS += \
            window_qtquick \                # QQuickWindow
            window_qmlapplicationengine \   # QQmlApplicationEngine
            window_shadereffects \          # Shaders!
            window_controls \               # (some) Qt Quick Controls
            window_controls_network \       # Qt Quick networking tests
            window_controls_gallery \       # Qt Quick Gallery example
    }
