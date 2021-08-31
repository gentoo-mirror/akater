# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Minor mode to synchronize org-mode buffer and trello board"
HOMEPAGE="https://github.com/org-trello/org-trello"

EGIT_REPO_URI="https://github.com/org-trello/org-trello.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DOCS="README.md"

RDEPEND="
	>=app-emacs/dash-2.12.1
	>=app-emacs/s-1.11.0
	>=app-emacs/deferred-0.4.0
	>=app-emacs/request-0.2.0
"

src_prepare() {
	if ! use test ; then
		rm org-trello-tools{-test.el,.el} test-install-{file.el,package.el}
	fi

	elisp_src_prepare
}
