# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Minor mode for performing structured editing of S-expressions"
HOMEPAGE="https://mumble.net/~campbell/emacs/
	https://www.emacswiki.org/emacs/ParEdit"
EGIT_REPO_URI="https://mumble.net/~campbell/git/paredit.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
DOCS=( NEWS CREDITS )
HTML_DOCS="paredit.html"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	default

	use test || rm test.el
}

src_compile() {
	elisp_src_compile

	${EMACS} -q --no-site-file --batch --load paredit.elc \
			 --eval '(with-temp-buffer
					   (paredit-insert-html-examples)
					   (write-file "paredit.html"))'

}

src_test() {
	${EMACS} -q --no-site-file --batch					\
			 --load paredit.elc							\
			 --load "${FILESDIR}/gentoo-${PN}-test.el"	\
			 --load test.elc							\
			 -f gentoo--paredit-test-wrap-up			\
		|| die "Paredit tests failed."					\
	&& rm test.el*
}
