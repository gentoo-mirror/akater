# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="The firmware for QCA AR7010/AR9271 802.11n USB NICs"
HOMEPAGE="https://atheros-qual.comm"
SRC_URI="https://github.com/qca/open-ath9k-htc-firmware/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="open-ath9k-htc-firmware-1.4.0"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE="ar9271 ar7010"
REQUIRED_USE="
	( || ( ar9271 ar7010 ) )
"
# target_firmware/CMakeLists.txt is so written that you can't actually use them in a single build

S="${WORKDIR}/${P}/target_firmware"

# we also need to
# - create ebuild repository cross-xtensa (cross-xtensa-qca, cross-xtensa-elf)
# - crossdev --gcc 4.9.4 --genv 'PORTAGE_TMPDIR="/var/tmp/notmpfs"' --stage1 --target xtensa
#
#   or maybe
#   crossdev --gcc 4.9.4 --genv 'PORTAGE_TMPDIR="/var/tmp/notmpfs"' --stage1 --target xtensa-qca
#   where qca is VENDOR
#
#   crossdev --gcc 4.9.4 --genv 'PORTAGE_TMPDIR="/var/tmp/notmpfs"' --stage1 --ex-pkg dev-libs/gmp --ex-pkg dev-libs/mpc --ex-pkg dev-libs/mpfr --target xtensa-qca
#
#   or maybe
#   crossdev --gcc 4.9.4 --genv 'PORTAGE_TMPDIR="/var/tmp/notmpfs"' --stage1 --ov-gcc local --ex-pkg dev-libs/gmp --ex-pkg dev-libs/mpc --ex-pkg dev-libs/mpfr --target xtensa
#
#   so that gcc-xtensa is present in ebuild repository “akater”
#   and we will also need to apply binutils, gcc patches from the directory local in qca/open-ath9k-htc-firmware
#   now, the question is, where do we put qca-specific patches

BDEPEND="
	>=sys-devel/binutils-2.23.1
	>=sys-devel/gcc-4.7.4
	sys-devel/m4
	>=dev-libs/gmp-5.0.5[static-libs]
	>=dev-libs/mpc-1.0.1[static-libs]
	>=dev-libs/mpfr-3.1.1[static-libs]
	>=dev-util/cmake-2.6
"

# BDEPEND="
# 	>=cross-xtensa-elf/binutils-2.23.1
# 	>=cross-xtensa-elf/gcc-4.7.4
# 	sys-devel/m4
# 	>=cross-xtensa-elf/gmp-5.0.5[static-libs]
# 	>=cross-xtensa-elf/mpc-1.0.1[static-libs]
# 	>=cross-xtensa-elf/mpfr-3.1.1[static-libs]
# 	>=dev-util/cmake-2.6
# "

RDEPEND=""

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	# local mycmakeargs=(
	# 	-DTARGET_K2=$(usex ar9271 ON OFF)
	# 	# -DTARGET_MAGPIE=$(usex ar7010 ON OFF)
	# 	-DCMAKE_INSTALL_PREFIX=/lib/firmware
	# )

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DCMAKE_INSTALL_PREFIX=/lib/firmware
	)

	if use ar9271 ; then
		mycmakeargs+=( "-DTARGET_K2=ON" )
	fi

	if use ar7010 ; then
		mycmakeargs+=( "-DTARGET_MAGPIE=ON" )
	fi

	cmake_src_configure
}

# src_install() {
# 	# cp target_firmware/*.fw /lib/firmware
# 	cmake_src_install
# }
