# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Convert english words between singular and plural"
HOMEPAGE="https://github.com/eschulte/jump.el"

EGIT_REPO_URI="https://github.com/eschulte/jump.el.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README"

BDEPEND="
		test? ( app-emacs/jump )"

src_prepare() {
	rm jump.el

	default
}
