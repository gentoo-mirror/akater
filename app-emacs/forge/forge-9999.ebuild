# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Access Git forges from Magit"
HOMEPAGE="https://github.com/magit/forge"

EGIT_REPO_URI="https://github.com/magit/forge.git"
EGIT_BRANCH="main"
# EGIT_REPO_URI="https://github.com/akater/forge.git"
# EGIT_BRANCH="main"
EGIT_CLONE_TYPE="mirror"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

ELISP_TEXINFO="../docs/forge.texi"
DOCS="../README.org"

S="${WORKDIR}/${P}/lisp"

BDEPEND="
	app-emacs/yaml
	sys-apps/texinfo
"
RDEPEND="
>=dev-vcs/git-2.7.0
>=app-emacs/closql-1.0.4
>=app-emacs/dash-2.18.1
>=app-emacs/emacsql-3.0.0
>=app-emacs/ghub-3.5.2
>=app-emacs/magit-3.0.0
>=app-emacs/markdown-mode-2.4
>=app-emacs/transient-0.3.3
app-emacs/treepy
app-emacs/with-editor
app-emacs/yaml
"

src_compile() {
	${EMACS} -batch -q --no-site-file --eval '(setq emacsql-sqlite-executable "/usr/bin/emacsql-sqlite")' -L . -f batch-byte-compile *.el
	if [[ -n ${ELISP_TEXINFO} ]]; then
		makeinfo ${ELISP_TEXINFO} || die
	fi
}
