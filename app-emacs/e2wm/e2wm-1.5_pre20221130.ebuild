# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24
MY_PN="emacs-window-manager"
MY_P="${MY_PN}-${PV}"

inherit elisp

DESCRIPTION="Simple window manager for Emacs"
HOMEPAGE="https://github.com/kiwanami/emacs-window-manager"

SRC_URI="https://github.com/akater/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="amd64 x86"
LICENSE="GPL-3"
SLOT="0"

IUSE="test"

S="${WORKDIR}/${MY_P}"

DOCS="README.markdown"

# BDEPEND="test? ( app-emacs/ecukes app-emacs/espuds app-emacs/window-layout )"
BDEPEND="test? ( app-emacs/window-layout )"

RDEPEND="
	>=app-emacs/window-layout-1.4
"

SITEFILE="50e2wm-gentoo.el"

src_compile() {
	if ! use test ; then
		rm test-${PN}-pst-class.el
	fi
	elisp_src_compile
}

src_test() {
	${EMACS} -batch -Q -L . -L ${SITELISP}/window-layout  \
			 -l test-${PN}-pst-class.elc                  \
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
	# todo:
	# ecukes-fuatures
	# ECUKES ?= $(shell find .cask/*/elpa/ecukes-*/bin/ecukes | tail -1)
	# ECUKES_OPTS ?= --tags ~@known --no-win
	# exec ${ECUKES} ${ECUKES_OPTS} features
}
