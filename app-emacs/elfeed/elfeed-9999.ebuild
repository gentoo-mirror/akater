# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="An Emacs Atom/RSS feed reader"
HOMEPAGE="https://github.com/skeeto/elfeed"

EGIT_REPO_URI="https://github.com/skeeto/elfeed.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="org emms web"

DOCS=( "README.md" "NEWS.md" "UNLICENSE")

RDEPEND="
	app-emacs/async
	org? ( || ( app-emacs/org app-emacs/org-mode ) )
	emms? ( app-emacs/emms )
	web? ( >=app-emacs/simple-httpd-1.5.1 )"

SITEFILE="50${PN}-gentoo.el"
SITEFILEWEB="50${PN}-web-gentoo.el"

src_prepare() {
	elisp_src_prepare

	if ! use org ; then
		rm elfeed-link.el
	fi

	if ! use emms ; then
		eapply "${FILESDIR}/${PN}"-3.3.0-no-emms.patch
	fi
}

src_compile() {
	mv elfeed-pkg.el elfeed-pkg
	elisp_src_compile
	mv elfeed-pkg elfeed-pkg.el

	if use web ; then
		cd web
		${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
				 --eval "(add-to-list 'load-path \"${S}\")" \
				 -f batch-byte-compile "${PN}"-web.el
		cd ..
	fi
}

# src_test() {
# 	BYTECOMPFLAGS="${BYTECOMPFLAGS} -L tests" \
# 	...
# }

src_install() {
	elisp_src_install

	if use web ; then
		cd web
		elisp-install "${PN}"-web *.{el,elc} elfeed.{css,js} index.html
		elisp-site-file-install "${FILESDIR}/${SITEFILEWEB}"
		cd ..
	fi
}
