# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.5"

inherit elisp git-r3

DESCRIPTION="Incremental Vertical completYon"
HOMEPAGE="https://github.com/abo-abo/swiper"

EGIT_REPO_URI="https://github.com/abo-abo/swiper.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="counsel hydra +swiper test"

REQUIRED_USE="
	counsel? ( swiper )
"

DOCS="README.md"

RDEPEND="
hydra? ( app-emacs/hydra )
"

src_prepare() {
	rm elpa.el
	use test || rm ivy-test.el
	use swiper || rm swiper.el
	use hydra || rm ivy-hydra.el
	default
}
