#!/bin/bash
set -e

PACKAGE_NAME=blossomos-sdk
VERSION=0.1.0
RELEASE=1
BUILDROOT=$(pwd)/rpmbuild
SPECS_DIR=$BUILDROOT/SPECS
SOURCES_DIR=$BUILDROOT/SOURCES

rm -rf $BUILDROOT
mkdir -p $SPECS_DIR $SOURCES_DIR

SPECFILE=$SPECS_DIR/$PACKAGE_NAME.spec

cat > $SPECFILE <<EOF
Name:           $PACKAGE_NAME
Version:        $VERSION
Release:        $RELEASE%{?dist}
Summary:        BlossomOS SDK metapackage for building UI, Arc and branding packages
License:        MIT
BuildArch:      noarch

# Development tools
Requires:       gcc
Requires:       gcc-c++
Requires:       make
Requires:       automake
Requires:       autoconf
Requires:       libtool
Requires:       binutils
Requires:       pkgconf
Requires:       git
Requires:       patch
Requires:       diffutils
Requires:       file
Requires:       gdb
Requires:       strace
Requires:       ltrace
Requires:       valgrind
Requires:       jq
Requires:       yq

# RPM build tools
Requires:       rpm-build
Requires:       rpmdevtools

# Arc (Rust) build dependencies
Requires:       cargo
Requires:       rust

# BlossomUI — build system
Requires:       cmake
Requires:       extra-cmake-modules
Requires:       zlib-devel
Requires:       libepoxy-devel
Requires:       flatpak-devel
Requires:       fontconfig-devel

# BlossomUI — Qt6 stack
Requires:       qt6-qtbase-devel
Requires:       qt6-qtsvg-devel
Requires:       qt6-qtdeclarative-devel

# BlossomUI — KF6 stack
Requires:       kf6-kcoreaddons-devel
Requires:       kf6-kcolorscheme-devel
Requires:       kf6-kconfig-devel
Requires:       kf6-kguiaddons-devel
Requires:       kf6-ki18n-devel
Requires:       kf6-kiconthemes-devel
Requires:       kf6-kwindowsystem-devel
Requires:       kf6-kcmutils-devel
Requires:       kf6-frameworkintegration-devel
Requires:       kf6-kirigami-devel
Requires:       kwin-devel
Requires:       kdecoration-devel
Requires:       kf6-baloo-devel
Requires:       kf6-karchive-devel
Requires:       kf6-kcrash-devel
Requires:       kf6-kdbusaddons-devel
Requires:       kf6-kdeclarative-devel
Requires:       kf6-kded-devel
Requires:       kf6-kdesu-devel
Requires:       kf6-kdoctools-devel
Requires:       kf6-kglobalaccel-devel
Requires:       kf6-kholidays-devel
Requires:       kf6-kidletime-devel
Requires:       kf6-kio-devel
Requires:       kf6-kirigami-addons-devel
Requires:       kf6-kitemmodels-devel
Requires:       kf6-knewstuff-devel
Requires:       kf6-knotifications-devel
Requires:       kf6-knotifyconfig-devel
Requires:       kf6-kpeople-devel
Requires:       kf6-kquickcharts-devel
Requires:       kf6-krunner-devel
Requires:       kf6-kstatusnotifieritem-devel
Requires:       kf6-ksvg-devel
Requires:       kf6-ktexteditor-devel
Requires:       kf6-ktextwidgets-devel
Requires:       kf6-kunitconversion-devel
Requires:       kf6-kuserfeedback-devel
Requires:       kf6-kwallet-devel
Requires:       kf6-networkmanager-qt-devel
Requires:       kf6-prison-devel
Requires:       kf6-threadweaver-devel
Requires:       kf6-kpackage-devel

# BlossomUI — Qt5 stack
Requires:       qt5-qtbase-devel
Requires:       qt5-qtsvg-devel
Requires:       qt5-qtdeclarative-devel

# BlossomUI — KF5 stack
Requires:       kf5-kcoreaddons-devel
Requires:       kf5-kconfig-devel
Requires:       kf5-kguiaddons-devel
Requires:       kf5-ki18n-devel
Requires:       kf5-kiconthemes-devel
Requires:       kf5-kwindowsystem-devel
Requires:       kf5-kcmutils-devel
Requires:       kf5-frameworkintegration-devel
Requires:       kf5-kirigami2-devel
Requires:       kf5-kpackage-devel

# Plasma patches — Qt6 stack
Requires:       qt6-qt5compat-devel
Requires:       qt6-qtbase-private-devel
Requires:       qt6-qtbase-static
Requires:       qt6-qtlocation-devel
Requires:       qt6-qtshadertools-devel
Requires:       qt6-qtwayland-devel
Requires:       qcoro-qt6-devel

# Plasma — KDE libs
Requires:       appstream-qt-devel
Requires:       knighttime-devel
Requires:       kpipewire-devel
Requires:       kscreenlocker-devel
Requires:       kwayland-devel
Requires:       layer-shell-qt-devel
Requires:       libkexiv2-qt6-devel
Requires:       libkscreen-devel
Requires:       libksysguard-devel
Requires:       libplasma-devel
Requires:       PackageKit-Qt6-devel
Requires:       phonon-qt6-devel
Requires:       plasma5support-devel
Requires:       plasma-activities-devel
Requires:       plasma-activities-stats-devel
Requires:       plasma-breeze-devel
Requires:       plasma-wayland-protocols-devel
Requires:       polkit-qt6-1-devel

# Plasma — system and X11 libs
Requires:       boost-devel
Requires:       chrpath
Requires:       iso-codes-devel
Requires:       libbsd-devel
Requires:       libcanberra-devel
Requires:       libGL-devel
Requires:       libqalculate-devel
Requires:       libraw1394-devel
Requires:       libSM-devel
Requires:       libXcomposite-devel
Requires:       libXcursor-devel
Requires:       libXdamage-devel
Requires:       libXdmcp-devel
Requires:       libXfixes-devel
Requires:       libXft-devel
Requires:       libxkbfile-devel
Requires:       libXrandr-devel
Requires:       libXtst-devel
Requires:       lm_sensors-devel
Requires:       mesa-libGLES-devel
Requires:       pam-devel
Requires:       pciutils-devel
Requires:       pipewire-devel
Requires:       wayland-protocols-devel
Requires:       xcb-util-cursor-devel
Requires:       xcb-util-devel
Requires:       xcb-util-image-devel
Requires:       xcb-util-keysyms-devel
Requires:       xcb-util-renderutil-devel
Requires:       xcb-util-wm-devel

# Fedora development
Requires:       rpmbuild
Requires:       koji

%description
Metapackage that pulls in all dependencies needed to build BlossomOS
components: BlossomUI (Qt/KDE theme), Arc (software center), and the
branding package. Intended for layering on rpm-ostree systems.

%prep
%build
%install

%files

%changelog
* $(LANG=C date +"%a %b %d %Y") Leonie Ain <me@koyu.space> - $VERSION-$RELEASE
- Initial release
EOF

rpmbuild -bb $SPECFILE --define "_topdir $BUILDROOT"

echo ""
echo "Build complete! RPM package:"
find $BUILDROOT/RPMS -name "*.rpm"
