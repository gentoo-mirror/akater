# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

# MY_P="emacs-async-${PV}"
DESCRIPTION="Simple library for asynchronous processing in Emacs"
HOMEPAGE="https://github.com/jwiegley/emacs-async"

EGIT_REPO_URI="https://github.com/jwiegley/emacs-async.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

# S="${WORKDIR}/${MY_P}"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"

src_compile() {
	elisp-compile *.el
	elisp-make-autoload-file
}
