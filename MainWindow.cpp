#include "MainWindow.h"
#include "ui_MainWindow.h"
#include <QtMultimedia/QAudioFormat>
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioOutput>
#include <QDebug>
#include <QFileDialog>
#include "pxtone/pxtnDescriptor.h"
#include <cstdio>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , m_pxtn_device(this, &m_pxtn)
    , ui(new Ui::MainWindow)
{
    m_pxtn.init();
    int channel_num = 2;
    int sample_rate = 44100;
    m_pxtn.set_destination_quality(channel_num, sample_rate);
    ui->setupUi(this);
    connect(ui->actionOpen, &QAction::triggered, this, &MainWindow::selectAndLoadFile);

    QAudioFormat format;
    // Set up the format, eg.
    format.setSampleRate(sample_rate);
    format.setChannelCount(channel_num);
    format.setSampleSize(16);
    format.setCodec("audio/pcm");
    format.setByteOrder(QAudioFormat::LittleEndian);
    format.setSampleType(QAudioFormat::SignedInt);

    QAudioDeviceInfo info(QAudioDeviceInfo::defaultOutputDevice());
    if (!info.isFormatSupported(format)) {
        qWarning() << "Raw audio format not supported by backend, cannot play audio.";
        return;
    }


    m_audio = new QAudioOutput(format, this);
    m_audio->setVolume(0.1);
    loadFile("/home/steven/Projects/Music/pxtone/my_project/1353.ptcop");
    m_scroll_area = new QScrollArea();
    m_keyboard_editor = new KeyboardEditor(&m_pxtn, m_audio);
    m_keyboard_editor->setMinimumSize(10000,1000);

    m_scroll_area->setWidget(m_keyboard_editor);
    m_scroll_area->setBackgroundRole(QPalette::Dark);
    setCentralWidget(m_scroll_area);
    m_scroll_area->setVisible(true);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::loadFile(QString filename) {
    std::unique_ptr<std::FILE, decltype(&fclose)> f(fopen(filename.toStdString().c_str(), "r"), &fclose);
    if (!f) { qWarning() << "Could not open file"; return; }
    pxtnDescriptor desc;
    desc.set_file_r(f.get());
    if (m_pxtn.read(&desc) != pxtnOK) { qWarning() << "Error reading file"; return; }
    if (m_pxtn.tones_ready() != pxtnOK) { qWarning() << "Error getting tones ready"; return; }
    pxtnVOMITPREPARATION prep{};
    prep.flags          |= pxtnVOMITPREPFLAG_loop;
    prep.start_pos_float =     0;
    prep.master_volume   = 0.80f;

    qDebug() << "Preparing moo for " << filename;
    bool success = m_pxtn.moo_preparation( &prep );
    if (!success) { qWarning() << "Moo preparation error"; return; }

    m_pxtn_device.open(QIODevice::ReadOnly);
    m_audio->start(&m_pxtn_device);
}

void MainWindow::selectAndLoadFile() {
    QString filename = QFileDialog::getOpenFileName(this, "Open file", "/home/steven/Projects/Music/pxtone/Examples/for-web", "pxtone projects (*.ptcop)");
    loadFile(filename);
}