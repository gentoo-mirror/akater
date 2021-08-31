# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake multilib

DESCRIPTION="Cross-platform library for building Telegram clients"
HOMEPAGE="https://core.telegram.org/tdlib"
SRC_URI="https://github.com/tdlib/td/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE="clang debug doc +gcc +low-ram lto java javascript"

REQUIRED_USE="
	gcc? ( !clang )
	!gcc? ( clang )
	java? ( !lto )
"

S="${WORKDIR}/td-${PV}"

DEPEND="gcc? ( >=sys-devel/gcc-4.9 )
	>=dev-util/cmake-3.0.2
	dev-util/gperf
	clang? ( >=sys-devel/clang-3.4 )
	low-ram? ( dev-lang/php[cli,ctype] )
	doc? (
		dev-lang/php
		app-doc/doxygen
		)
	java? ( virtual/jdk )"

# low-ram means “less than 3.5 Gb RAM” according to upstream

# maybe php ctype needed in doc too

# php for doxygen is needed at least due to SERVER_BASED_SEARCH = NO in tdlib's Doxyfile

# Note that for Node.js ≤ 9.11.2 you must build TDLib with OpenSSL 1.0.* and for Node.js ≥ 10 with OpenSSL 1.1.* instead, so you may need to modify the following commands to install a proper OpenSSL version.

# according to TDLib build instructions, lto excludes java

RDEPEND="dev-libs/openssl
	sys-libs/zlib"

CMAKE_MIN_VERSION=3.0.2

src_configure(){
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=$(usex debug Debug Release)
		# ebuild must not install into /usr/local
		# Any binary which links against a library under /usr must itself go into /usr
		-DCMAKE_INSTALL_PREFIX=/usr
		-DTD_ENABLE_LTO=$(usex lto ON OFF)
		# java target compilation seems to be a totally separate procedure with its own logic
		# maybe even requiring net-im/tdlib-java
		-DTD_ENABLE_JNI=OFF
		# According to TDLib build instructions, the following is only needed
		# for using tdlib from C# under Windows through C++/CLI
		-DTD_ENABLE_DOTNET=OFF
	)
	local generic_makeopts=${MAKEOPTS}

	# doesn't seem necessary
	# if use lto ; then
	# 	# default on my Gentoo profile:
	# 	# LDFLAGS="-Wl,-O1 -Wl,--as-needed"
	# 	LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,-flto"
	# fi

	# why do TDLib build instructions recommend empty cxxflags?

	# if clang ; then
	# 	CXXFLAGS="-stdlib=libc++"
	# 	CC=/usr/bin/clang
	# 	CXX=/usr/bin/clang++
	# else
	# 	CXXFLAGS=""
	# fi

	if use low-ram; then
		MAKEOPTS="-j1"
	fi

	cmake_src_configure

	if use low-ram; then

		cd "${BUILD_DIR}"
		# emake ${generic_makeopts} prepare_cross_compiling
		emake -j2 prepare_cross_compiling

		cd "${S}"
		einfo "Splitting source..."
		php SplitSource.php || die "There were errors during splitting."
		# fixme: this die never really catches anything
	fi

}

# cmake --build . --target prepare_cross_compiling
# cd ..
# php SplitSource.php
# cd S
# cmake --build . --target install
# cd ..
# php SplitSource.php --undo
# cd ..
# ls -l td/tdlib

# Run these commands in Bash to build TDLib and to install it to td/tdlib:

# git clone https://github.com/tdlib/td.git
# cd td
# rm -rf S
# mkdir S
# cd S
# export CXXFLAGS=""
# cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DTD_ENABLE_LTO=ON ..
# cmake --build . --target install
# cd ..
# cd ..
# ls -l td/tdlib

# If java

# export CXXFLAGS=""

src_compile() {

	# with java, we seemingly have to configure again
	# so we have to configure inside src_compile which doesn't make much sense to me
	# if use java ; then

	# 	die "Java use not ready."

	# /example/java is here:
	# /var/tmp/portage/net-im/tdlib-1.4.0/work/td-1.4.0

	# 	mycmakeargs+=(
	# 		-DCMAKE_INSTALL_PREFIX=../example/java/td
	# 		-DTD_ENABLE_JNI=ON
	# 	)
	# 	# cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../example/java/td -DTD_ENABLE_JNI=ON ..
	# 	# cmake --build . --target install
	# 	# cd ..

	# 	# my guess:
	# 	# S=${WORKDIR}/example/java

	# 	# cd example/java
	# 	# rm -rf build
	# 	# mkdir build
	# 	# cd build
	# 	mycmakeargs+=(
	# 		-DCMAKE_INSTALL_PREFIX=../../../tdlib
	# 		-DTd_DIR=$(readlink -e ../td/lib/cmake/Td)
	# 	)
	# 	# cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../../../tdlib -DTd_DIR:PATH=$(readlink -e ../td/lib/cmake/Td) ..
	# 	# cmake_src_make
	# 	# cmake --build . --target install
	# 	# cd ../../..
	# 	# cd ..
	# 	# ls -l td/tdlib
	# fi
	# maybe all this should go to src_prepare() ?

	cmake_src_compile

	if use low-ram; then
		php SplitSource.php --undo
	fi

	if use doc; then
		"${EPYTHON}" doxybuild.py --doxygen="${EPREFIX}"/usr/bin/doxygen || die
		HTML_DOCS=( dist/doxygen/tdlib*/. )
	fi
}

src_install() {

	cmake_src_install

	# On multilib system I did this:
	#
	# Do not violate multilib strict
	# mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"

	# but this breaks install on no-multilib
}
