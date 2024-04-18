# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Convert Telegram's animated stickers in TGS format into series of PNG images "
HOMEPAGE="https://github.com/zevlg/tgs2png"

EGIT_REPO_URI="https://github.com/zevlg/tgs2png.git"
EGIT_CLONE_TYPE="shallow"
EGIT_SUBMODULES=()
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	media-libs/libpng
	media-libs/rlottie
"

BDEPEND="${RDEPEND}
	>=dev-build/cmake-3.3
"
DOCS="README.md"

src_install() {
	dobin "${BUILD_DIR}"/tgs2png
}
