# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp readme.gentoo-r1 git-r3 git-extras

DESCRIPTION="An Emacs mode for notes and project planning"
HOMEPAGE="https://www.orgmode.org/"

EGIT_REPO_URI="https://gitlab.com/akater/org-mode.git"
EGIT_BRANCH="main"
EGIT_CLONE_TYPE="mirror"
# EGIT_REPO_URI="https://git.savannah.gnu.org/emacs/org-mode.git"
# EGIT_BRANCH="single+tags"

LICENSE="GPL-3+ FDL-1.3+ odt-schema? ( OASIS-Open )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~x86"
IUSE="doc odt-schema"
RESTRICT="test"

BDEPEND="doc? ( virtual/texi2dvi )"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	git branch work
	git switch work
	# git-merge ob-lisp-traces-and-errors
	git-merge org-element-cleaner-parsers
	git-merge ob-lisp-akater
	# git-merge ob-generic-blocks

	default
}

src_compile() {
	emake datadir="${EPREFIX}${SITEETC}/${PN}"
	use doc && emake pdf card
}

src_install() {
	emake \
		DESTDIR="${D}" \
		ETCDIRS="styles $(use odt-schema && echo schema)" \
		lispdir="${EPREFIX}${SITELISP}/${PN}" \
		datadir="${EPREFIX}${SITEETC}/${PN}" \
		infodir="${EPREFIX}/usr/share/info" \
		install

	cp "${FILESDIR}/${SITEFILE}" "${T}/${SITEFILE}" || die

	elisp-site-file-install "${T}/${SITEFILE}"
	dodoc README etc/ORG-NEWS
	use doc && dodoc doc/org.pdf doc/orgcard.pdf doc/orgguide.pdf

	DOC_CONTENTS="Org mode has a large variety of run-time dependencies,
		so you may have to install one or more additional packages.
		A non-exhaustive list of these dependencies may be found at
		<http://orgmode.org/worg/org-dependencies.html>."
	readme.gentoo_create_doc
}
