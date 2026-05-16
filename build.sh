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
