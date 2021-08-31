# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="A configuration macro for simplifying your .emacs"
HOMEPAGE="https://github.com/jwiegley/use-package"

EGIT_REPO_URI="https://github.com/jwiegley/use-package.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="doc"
ELISP_TEXINFO="use-package.texi"
SITEFILE="50${PN}-gentoo.el"

DOCS=( "README.md" "NEWS.md" )
HTML_DOCS="use-package.html"

BDEPEND="
doc? ( virtual/tex-base )
"

src_compile() {
	emake elc
	# texi itself can be generated from org
	# but it can't load ox-extra
	# maybe it requires org-plus-contrib which is now separate
	# export DOC_LOAD_PATH="-L ${SITELISP}/org"
	# emake texi
	emake info
	emake html
	use doc && DOCS+="use-package.pdf" && emake pdf
}
