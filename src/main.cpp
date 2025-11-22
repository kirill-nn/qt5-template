#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

int main(int argc, char** argv) {
    QGuiApplication app(argc, argv);
#ifdef __APPLE__
    QQuickWindow::setSceneGraphBackend(QSGRendererInterface::MetalRhi);
#endif

    QQmlApplicationEngine engine {};
    engine.load(QUrl(QStringLiteral("qrc:/MainWindow.qml")));
    return QApplication::exec();
}
