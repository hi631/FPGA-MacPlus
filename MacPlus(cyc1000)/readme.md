# Macintosh Plus for the [MiSTer Board](https://github.com/MiSTer-devel/Main_MiSTer/wiki)
This is a port of the [Plus Too core](https://github.com/mist-devel/mist-binaries/tree/master/cores/plus_too) from MiST which is the port of the [Plus Too project](http://www.bigmessowires.com/plus-too/).
I've tried to optimize the code with converting to synchronous style and fixing some glitches and instabilities.

＃Macintosh Plus for [MiSTer Board]（https://github.com/MiSTer-devel/Main_MiSTer/wiki）
これは、[Plus Tooプロジェクト]のポートであるMiSTからの[Plus Tooコア]（https://github.com/mist-devel/mist-binaries/tree/master/cores/plus_too）のポートです（ http://www.bigmessowires.com/plus-too/）。
同期スタイルに変換し、いくつかの不具合や不安定性を修正して、コードを最適化しようとしました。

## Usage

* Copy the [*.rbf](https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases) onto the root of SD card
* Copy the [boot.rom](https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases) to MacPlus folder
* Copy disk images in dsk format (e.g. Disk605.dsk) to MacPlus folder

After a few seconds the floppy disk icon should
appear. Open the on screen display using the F12 key and select the
a disk image. The upload of the disk image will take a few seconds. MacPlus will then boot into the MacOS desktop.

＃＃ 使用法

* [* .rbf]（https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases）をSDカードのルートにコピーします
* [boot.rom]（https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases）をMacPlusフォルダにコピーします
*ディスクイメージをdsk形式（Disk605.dskなど）でMacPlusフォルダーにコピーする

数秒後、フロッピーディスクのアイコンが表示されます。
現れる。 F12キーを使用してオンスクリーンディスプレイを開き、
ディスクイメージ。 ディスクイメージのアップロードには数秒かかります。 MacPlusがMacOSデスクトップで起動します。

## Floppy disk image format
Floppy disk images need to be in raw disk format. Double sided 800k disk images have to be exactly 819200 bytes in size. Single sided 400k disk images have to be exactly 409600 bytes in size.
Both the internal as well as the external floppy disk are supported. The first entry in the OSD refers to the internal floppy disk, the second one to the external floppy disk.
Currently floppy disk images cannot be loaded while the Mac accesses a floppy disk. Thus it's recommended to wait for the desktop to appear until a second floppy can be inserted.
Before loading a different disk image it's recommended to eject the previously inserted disk image from within MacOS.
Official system disk images are available from apple at [here](https://web.archive.org/web/20141025043714/http://www.info.apple.com/support/oldersoftwarelist.html). Under Linux these can be converted into the desired dsk format using [Linux stuffit](http://web.archive.org/web/20060205025441/http://www.stuffit.com/downloads/files/stuffit520.611linux-i386.tar.gz), unar and [dc2dsk](http://www.bigmessowires.com/dc2dsk.c) in that order. A shell script has been provided for convenience at [releases/bin2dsk.sh](releases/bin2dsk.sh).

##フロッピーディスクイメージ形式
フロッピーディスクイメージはrawディスク形式である必要があります。両面800kディスクイメージは、正確に819200バイトのサイズでなければなりません。片面400kディスクイメージのサイズは、正確に409600バイトでなければなりません。
内蔵フロッピーディスクと外付けフロッピーディスクの両方がサポートされています。 OSDの最初のエントリは内部フロッピーディスクを参照し、2番目のエントリは外部フロッピーディスクを参照します。
現在、Macがフロッピーディスクにアクセスしている間は、フロッピーディスクイメージをロードできません。したがって、2枚目のフロッピーを挿入できるようになるまでデスクトップが表示されるのを待つことをお勧めします。
別のディスクイメージをロードする前に、以前に挿入したディスクイメージをMacOS内から取り出すことをお勧めします。
公式のシステムディスクイメージは、アップルの[こちら]（https://web.archive.org/web/20141025043714/http://www.info.apple.com/support/oldersoftwarelist.html）から入手できます。 Linuxでは、[Linux stuffit]（http://web.archive.org/web/20060205025441/http://www.stuffit.com/downloads/files/stuffit520.611linux-i386）を使用して、これらを目的のdsk形式に変換できます。 .tar.gz）、unar、[dc2dsk]（http://www.bigmessowires.com/dc2dsk.c）の順番で。 [releases / bin2dsk.sh]（releases / bin2dsk.sh）には、便利なシェルスクリプトが用意されています。

## Hard disk support
This MacPlus core implements the SCSI interface of the Macintosh Plus together with a 20MB harddisk. The core implements only a subset of the SCSI commands. This is currently sufficient to read and write the disk, to boot from it and to format it using the setup tools that come with MacOS 6.0.8.
The harddisk image to be used can be selected from the "Mount *.vhd" entry in the on-screen-display. Copy the boot.vhd to MacPlus folder and it will be automatically mounted at start. The format of the disk image is the same as being used by the SCSI2SD project which is documented [here](http://www.codesrc.com/mediawiki/index.php?title=HFSFromScratch).
Unlike the floppy the SCSI disk is writable and data can be written to the disk from within the core.
It has been tested that OS 6.0.8 can format the SCSI disk as well as doing a full installation from floppy disk to the harddisk. But keep in mind that this is an early work in progress and expect data loss when working with HDD images.
A matching harddisk image file can be found [here](https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases). This is a 20MB harddisk image with correct partitioning information and a basic SCSI driver installed. The data partition itself is empty and unformatted. After booting the Mac will thus ask whether the disk is to be initialized. Saying yes and giving the disk a name will result im a usable file system. You don't need to use the Setup tool to format this disk as it is already formatted. But you can format it if you want to. This is only been tested with OS 6.0.8.

##ハードディスクのサポート
このMacPlusコアは、Macintosh PlusのSCSIインターフェイスと20MBのハードディスクを実装しています。コアはSCSIコマンドのサブセットのみを実装します。これは現在、ディスクの読み取りと書き込み、ディスクからの起動、MacOS 6.0.8に付属のセットアップツールを使用したフォーマットに十分です。
使用するハードディスクイメージは、オンスクリーンディスプレイの「Mount * .vhd」エントリから選択できます。 boot.vhdをMacPlusフォルダにコピーすると、起動時に自動的にマウントされます。ディスクイメージのフォーマットは、[ここ]（http://www.codesrc.com/mediawiki/index.php?title=HFSFromScratch）に記載されているSCSI2SDプロジェクトで使用されているものと同じです。
フロッピーとは異なり、SCSIディスクは書き込み可能で、コア内からディスクにデータを書き込むことができます。
OS 6.0.8がSCSIディスクをフォーマットし、フロッピーディスクからハードディスクに完全にインストールできることがテストされています。ただし、これは初期段階の作業であり、HDDイメージを使用する場合はデータの損失が予想されることに注意してください。
一致するハードディスクイメージファイルは[こちら]（https://github.com/MiSTer-devel/MacPlus_MiSTer/tree/master/releases）にあります。これは、正しいパーティション情報と基本的なSCSIドライバがインストールされた20MBのハードディスクイメージです。データパーティション自体は空で、フォーマットされていません。したがって、Macの起動後、ディスクを初期化するかどうかを尋ねられます。はいと言ってディスクに名前を付けると、使用可能なファイルシステムになります。このディスクは既にフォーマットされているため、セットアップツールを使用してフォーマットする必要はありません。ただし、必要に応じてフォーマットできます。これはOS 6.0.8でのみテストされています。

## CPU Speed
The CPU speed can be adjusted from "normal" which is roughly Mac Plus speed to "Fast" which is about 2.5 times faster. Original core couldn't boot from SCSI in turbo mode. This port has workaround to let it boot even with turbo mode.
## CPU速度
CPU速度は、おおよそMac Plus速度である「通常」から約2.5倍速い「高速」まで調整できます。 元のコアはターボモードでSCSIから起動できませんでした。 このポートには、ターボモードでも起動できる回避策があります。

## Memory
512KB, 1MB and 4MB memory configs are available. Cold boot with 4MB RAM selected takes some time before it start to boot from FDD/SCSI, so be patient. Warm boot won't take long time.
##メモリ
512KB、1MBおよび4MBのメモリ構成が利用可能です。 4MB RAMを選択した状態でのコールドブートは、FDD / SCSIからブートを開始するまでに時間がかかるため、しばらくお待ちください。 ウォームブートには時間がかかりません。

## Keyboard
The Alt key is mapped to the Mac's command key, and the Windows key is mapped to the Mac's option key. Core emulates keyboard with keypad.
##キーボード
AltキーはMacのコマンドキーにマップされ、WindowsキーはMacのオプションキーにマップされます。 コアはキーパッドでキーボードをエミュレートします。