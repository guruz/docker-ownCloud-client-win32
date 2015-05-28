FROM opensuse:13.2

MAINTAINER Daniel Molkentin <danimo@owncloud.com>

ENV TERM ansi
ENV HOME /root

RUN zypper --non-interactive --gpg-auto-import-keys refresh
RUN zypper --non-interactive --gpg-auto-import-keys ar http://download.opensuse.org/repositories/windows:/mingw/openSUSE_13.2/windows:mingw.repo
RUN zypper --non-interactive --gpg-auto-import-keys ar http://download.opensuse.org/repositories/windows:/mingw:/win32/openSUSE_13.2/windows:mingw:win32.repo
RUN zypper --non-interactive --gpg-auto-import-keys install cmake make mingw32-cross-binutils mingw32-cross-cpp mingw32-cross-gcc \
                      mingw32-cross-gcc-c++ mingw32-cross-pkg-config mingw32-filesystem \
                      mingw32-headers mingw32-runtime site-config \
                      mingw32-cross-libqt5-qmake mingw32-cross-libqt5-qttools mingw32-libqt5* \
                      mingw32-qt5keychain* mingw32-angleproject* \
                      mingw32-cross-nsis mingw32-cross-nsis-plugin-uac mingw32-cross-nsis-plugin-nsprocess \
                      mingw32-libopenssl* mingw32-sqlite* kdewin-png2ico \
                      osslsigncode wget

# RPM depends on curl for installs from HTTP
RUN zypper --non-interactive --gpg-auto-import-keys install curl

CMD /bin/bash
