# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

UPSTREAM_V01_COMMIT="25c15b7c2ca3b1a580a383d9d3cb13bf8531d04a"

DESCRIPTION="Convert Telegram's animated stickers in TGS format into series of PNG images"
HOMEPAGE="https://github.com/zevlg/tgs2png"

SRC_URI="https://github.com/zevlg/tgs2png/archive/${UPSTREAM_V01_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	media-libs/libpng
	=media-libs/rlottie-0.2_p20220123
"

BDEPEND="${RDEPEND}
	>=dev-build/cmake-3.3
"
DOCS="README.md"

S="${WORKDIR}/tgs2png-${UPSTREAM_V01_COMMIT}"

src_install() {
	dobin "${BUILD_DIR}"/tgs2png
}
