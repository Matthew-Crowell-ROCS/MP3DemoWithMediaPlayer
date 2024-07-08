#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
        );

    // load Main.qml from MP3Demo QML Module
    engine.load(QUrl(QStringLiteral("qrc:/MP3Demo/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
