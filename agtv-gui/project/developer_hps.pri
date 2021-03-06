message("setting paths and settings for $${DEVELOPER}}")

# CONFIG += winternalvlc

win32 {
    VLC_QT_PATH = "E:\Qt\VLC-Qt_1.0.0_win32_mingw"
    LIBCOMMUNI_PATH = "E:\libcommuni"
} else {
    LIBCOMMUNI_PATH = /home/hps/libcommuni
}

macx {
    DEPLOYMENT = yes
    VLC_QT_PATH = "/Users/hps/Dropbox/Qt/VLC-Qt_1.0.0_osx"
}

release {
    macx {
        equals(DEPLOYMENT, "yes") {
            message("OS X deployment activated")
            makedmg.commands = ~/Qt/5.5/clang_64/bin/macdeployqt $$OUT_PWD/agtv.app -dmg
            first.depends = $(first) makedmg
            export(first.depends)
            export(makedmg.commands)
            QMAKE_EXTRA_TARGETS += first makedmg
        }
    }
}
