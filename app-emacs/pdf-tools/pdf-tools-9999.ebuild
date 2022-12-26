# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.3"

inherit autotools elisp git-r3

DESCRIPTION="Support library for PDF documents"
HOMEPAGE="https://github.com/vedang/pdf-tools/"

# EGIT_REPO_URI="https://github.com/vedang/pdf-tools.git"
EGIT_REPO_URI="https://github.com/akater/pdf-tools.git"
EGIT_BRANCH="gentoo-fix-tests"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND="
	app-editors/emacs[gui]
	|| ( >=app-editors/emacs-25.1 app-emacs/let-alist )
	>=app-emacs/tablist-1.0
	>=app-text/poppler-0.16[cairo,png]
	dev-libs/glib
"
RDEPEND="
	app-editors/emacs[gui]
	|| ( >=app-editors/emacs-25.1 app-emacs/let-alist )
	>=app-emacs/tablist-1.0
	>=app-text/poppler-0.16[cairo,png]
	dev-libs/glib
"

SITEFILE="50${PN}-gentoo.el"
DOCS="NEWS README.org"

src_prepare() {
	elisp_src_prepare

	cd server || die
	eautoreconf
}

src_configure() {
	cd server || die
	econf
}

src_compile() {
	BYTECOMPFLAGS="-L lisp"
	elisp-compile lisp/*.el
	elisp-make-autoload-file lisp/${PN}-autoloads.el lisp

	emake -C server
}

src_test() {
	# emake check
	${EMACS} -Q -batch					\
			 -L ${SITELISP}/tablist     \
			 -L lisp -L test		    \
			 -l test-helper			    \
			 --eval "				    \
(setq default-directory				    \
  (expand-file-name \"test\"))"		    \
			 -l pdf-cache-test		    \
			 -l pdf-info-test		    \
			 -l pdf-loader-test		    \
			 -l pdf-sync-test			\
			 -l pdf-tools-test			\
			 -l pdf-util-test			\
			 -l pdf-view-test			\
			 -l pdf-virtual-test		\
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."

	# I don't understand what is supposed to happen here:
	# emake server-test
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

	emake -C server DESTDIR="${D}" install
}
