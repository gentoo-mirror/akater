# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.1"

inherit elisp git-r3

DESCRIPTION="Conveniently act on minibuffer completions"
HOMEPAGE="https://github.com/oantolin/embark"

EGIT_REPO_URI="https://github.com/oantolin/embark.git"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="avy consult"

DOCS="README.org"

ELISP_TEXINFO="${PN}.texi"

BDEPEND="
	consult? ( app-emacs/consult )
"
RDEPEND="
	avy? ( app-emacs/avy )
	consult? ( app-emacs/consult )
"

src_prepare() {
	use avy || rm avy-embark-collect.el
	use consult || rm embark-consult.el
	default
}
