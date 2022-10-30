# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3 git-extras

DESCRIPTION="SLIME, the Superior Lisp Interaction Mode (Extended)"
HOMEPAGE="http://common-lisp.net/project/slime/"
# EGIT_REPO_URI="https://github.com/slime/slime.git"
# EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/akater/slime.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="mirror"

LICENSE="GPL-2 xref? ( xref.lisp )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc company +system-cl-lib system-ert system-macrostep xref"
RESTRICT=test # tests fail to contact sbcl

RDEPEND="virtual/commonlisp
	dev-lisp/asdf
	system-macrostep? ( >=app-emacs/macrostep-0.9 )"
BDEPEND="${RDEPEND}
	>=sys-apps/texinfo-5.1
	doc? ( virtual/texi2dvi )"
PDEPEND="company? ( app-emacs/slime-company )"
# Suggested variable, may be in future eapi
# SDEPEND="company? ( app-emacs/slime-company )"

CLPACKAGE=swank
CLSYSTEMS=swank
SITEFILE=70${PN}-gentoo.el

src_prepare() {
	git branch work
	git switch work
	git-merge modern-symbols
	git-merge no-obsolete-functions
	git-merge main-fixes
	git-merge slime-asdf-fixes
	git-merge grab-multiple-outputs

	# bundled cl-lib is likely only needed for emacs 23
	if use system-cl-lib ; then
		rm lib/cl-lib.el
		eapply "${FILESDIR}/${PN}"-2.26-system-cl-lib.patch
	else
		# here, we better emit a warning
		# if eselect emacs show | grep emacs- | sed "s/ *emacs-//"
		# is 23 or older
		eapply "${FILESDIR}/${PN}"-2.26-no-system-cl-lib.patch
	fi

	default
	# Remove xref.lisp (which is non-free) unless USE flag is set
	use xref || rm -f xref.lisp

	eapply "${FILESDIR}/${PN}"-2.25-move-one-defalias.patch

	if use system-macrostep ; then
		rm lib/macrostep.el
		eapply "${FILESDIR}/${PN}"-2.25-system-macrostep.patch
	else
		eapply "${FILESDIR}/${PN}"-2.25-no-system-macrostep.patch
	fi

	if use system-ert ; then
		rm lib/ert.el
		rm lib/ert-x.el
		eapply "${FILESDIR}/${PN}"-2.26-system-ert.patch
	else
		eapply "${FILESDIR}/${PN}"-2.26-no-system-ert.patch
	fi
}

src_compile() {
	elisp-compile *.el
	BYTECOMPFLAGS="${BYTECOMPFLAGS} -L contrib -l slime" \
		elisp-compile contrib/*.el lib/*.el

	emake -C doc slime.info
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			emake -C doc all
	fi
}

src_install() {
	# Install core
	elisp-install ${PN} *.{el,elc,lisp}

	# Install contribs
	elisp-install ${PN}/contrib/ contrib/*.{el,elc,lisp,scm,goo}

	# Install lib
	elisp-install ${PN}/lib/ lib/*.{el,elc}

	# Install swank
	elisp-install ${PN}/swank/ swank/*.lisp

	elisp-site-file-install "${FILESDIR}"/${SITEFILE}
	# Install docs
	dodoc README.md CONTRIBUTING.md NEWS PROBLEMS
	newdoc contrib/README.md README-contrib.md
	doinfo doc/slime.info
	use doc && dodoc doc/*.pdf

	# Bug #656760
	touch "${ED}${SITELISP}/${PN}/lib/.nosearch" || die
}
