# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

inherit elisp git-r3

DESCRIPTION="vi-like Paredit."
HOMEPAGE="https://github.com/abo-abo/lispy"

EGIT_REPO_URI="https://github.com/abo-abo/lispy.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="clojure javascript test"
# todo: clojure requires some cider things

DOCS="README.md"

BDEPEND="app-emacs/iedit
		app-emacs/ivy[swiper]
		|| ( app-emacs/org app-emacs/org-mode )
"
RDEPEND="
	app-emacs/ace-window
	app-emacs/avy
	app-emacs/hydra
	app-emacs/iedit
	app-emacs/ivy[swiper]
	app-emacs/zoutline
	javascript? ( app-emacs/indium )
"

src_prepare() {
	rm lispy-pkg.el
	rm elpa.el

	use javascript || rm le-js.el

	if ! use clojure ; then
		rm le-clojure.el
		rm *.cljs
		rm *.clj
	fi

	use test || rm lispy-test.el

	default
}
