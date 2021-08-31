# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# inherit multilib
inherit cmake git-r3

# from mva
#inherit multibuild

DESCRIPTION="Cross-platform library for building Telegram clients"
HOMEPAGE="https://core.telegram.org/tdlib"
EGIT_REPO_URI="https://github.com/tdlib/td"
EGIT_COMMIT_TYPE="single+tags"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="clang cli debug doc +gcc low-ram lto java javascript"

REQUIRED_USE="
	gcc? ( !clang )
	!gcc? ( clang )
	java? ( !lto )
"

# mva dosn't have it but it is probably achieved by his src_prepare
# S="${WORKDIR}/td-${PV}"

# From mva
# BDEPEND="
# 	|| (
# 		>=sys-devel/clang-3.4:=
# 		>=sys-devel/gcc-4.9:=
# 	)
# 	dev-util/gperf
# 	virtual/jdk:=
# "

BDEPEND="gcc? ( >=sys-devel/gcc-4.9:= )
	>=dev-util/cmake-3.0.2
	dev-util/gperf
	clang? ( >=sys-devel/clang-3.4:= )
	low-ram? ( dev-lang/php[cli,ctype] )
	doc? (
		dev-lang/php
		app-doc/doxygen
		)
	java? ( virtual/jdk:= )"

# maybe php ctype needed in doc too

# php for doxygen is needed at least due to SERVER_BASED_SEARCH = NO in tdlib's Doxyfile

# Note that for Node.js ≤ 9.11.2 you must build TDLib with OpenSSL 1.0.* and for Node.js ≥ 10 with OpenSSL 1.1.* instead, so you may need to modify the following commands to install a proper OpenSSL version.

# according to TDLib build instructions, lto excludes java

RDEPEND="dev-libs/openssl:0=
	sys-libs/zlib"

# from mva
# DEPEND="
# 	${BDEPEND}
# 	${RDEPEND}
# 	>=dev-util/cmake-3.0.2
# "

DOCS=( README.md )

CMAKE_MIN_VERSION=3.0.2

# from mva
src_prepare() {
	sed -r \
		-e '/install\(TARGETS/,/  INCLUDES/{s@(LIBRARY DESTINATION).*@\1 ${CMAKE_INSTALL_LIBDIR}@;s@(ARCHIVE DESTINATION).*@\1 ${CMAKE_INSTALL_LIBDIR}@;s@(RUNTIME DESTINATION).*@\1 ${CMAKE_INSTALL_BINDIR}@}' \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure(){
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=$(usex debug Debug Release)
		# ebuild must not install into /usr/local
		# Any binary which links against a library under /usr must itself go into /usr
		# -DCMAKE_INSTALL_PREFIX=/usr
		-DTD_ENABLE_LTO=$(usex lto ON OFF)
		# java target compilation seems to be a totally separate procedure with its own logic
		# maybe even requiring net-im/tdlib-java
		-DTD_ENABLE_JNI=$(usex java ON OFF)
		# According to TDLib build instructions, the following is only needed
		# for using tdlib from C# under Windows through C++/CLI
		-DTD_ENABLE_DOTNET=OFF
	)

	# doesn't seem necessary
	# if use lto ; then
	# 	# default on my Gentoo profile:
	# 	# LDFLAGS="-Wl,-O1 -Wl,--as-needed"
	# 	LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,-flto"
	# fi

	# why do TDLib build instructions recommend empty cxxflags?

	# if clang ; then
	# 	export CXXFLAGS="-stdlib=libc++"
	# 	CC=/usr/bin/clang
	# 	CXX=/usr/bin/clang++
	# else
	# 	export CXXFLAGS=""
	# fi

	if use low-ram; then

		MAKEOPTS="-j1"
		# todo: set target via $CTARGET as told in devmanual.gentoo.org
		cmake_src_configure --target prepare_cross_compiling

		# todo: die on errors here
		php SplitSource.php
		# as of now, it won't split three files

	else
		cmake_src_configure
	fi

}

# If less than 3.5 Gb RAM

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

# mva doesn't have src_compile We have because we attempted to support doxygen

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

	# cmake_src_configure --target tdjson

	cmake_src_compile

	# if use low-ram; then

	# 	echo "directory I'm in before running php SplitSource.php --undo "
	# 	echo `ls`

	# 	# cd ..
	# 	php SplitSource.php --undo
	# 	cd ..
	# fi

	if use doc; then
		"${EPYTHON}" doxybuild.py --doxygen="${EPREFIX}"/usr/bin/doxygen || die
		HTML_DOCS=( dist/doxygen/tdlib*/. )
	fi
}

src_install() {

	if use low-ram; then

		echo "directory I'm in before running php SplitSource.php --undo "
		echo `ls`

		# cd ..
		php SplitSource.php --undo
		# cd ..
	fi

	cmake_src_install

	use cli && dobin "${BUILD_DIR}"/tg_cli

	# from mva
	#	exeinto "/usr/$(get_libdir)"
	#	doexe "${BUILD_DIR}"/libtdjson.so
	#	^ NULLed DT_RUNPATH :'(

	# from old multilib note
	# Do not violate multilib strict
	# mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"

}
