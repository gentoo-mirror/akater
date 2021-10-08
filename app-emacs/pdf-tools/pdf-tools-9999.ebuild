# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Support library for PDF documents"
HOMEPAGE="https://github.com/vedang/pdf-tools/"

EGIT_REPO_URI="https://github.com/vedang/pdf-tools.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

IUSE="test"

BDEPEND="
	app-editors/emacs[gui]
	>=app-emacs/tablist-1.0
	>=app-text/poppler-0.16[cairo,png]
	test? ( app-emacs/cask dev-libs/glib )
"
RDEPEND="
	app-editors/emacs[gui]
	>=app-emacs/tablist-1.0
	>=app-text/poppler-0.16[cairo,png]
	dev-libs/glib
"

SITEFILE="50${PN}-gentoo.el"
DOCS="NEWS README.org"

src_compile() {
	BYTECOMPFLAGS="-L lisp"
	elisp-compile lisp/*.el
	emake server/epdfinfo
}

src_test() {
	emake check
	emake server-test
}

src_install() {
	# elisp_src_install:
	elisp-install ${PN} lisp/*.el lisp/*.elc
	if [[ -n ${SITEFILE} ]]; then
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi
	if [[ -n ${ELISP_TEXINFO} ]]; then
		set -- ${ELISP_TEXINFO}
		set -- ${@##*/}
		doinfo ${@/%.*/.info*}
	fi
	# install documentation only when explicitly requested
	[[ $(declare -p DOCS 2>/dev/null) == *=* ]] && einstalldocs
	if declare -f readme.gentoo_create_doc >/dev/null; then
		readme.gentoo_create_doc
	fi

	dobin server/epdfinfo
}
