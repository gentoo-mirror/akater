# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Run a Ruby process in a buffer"
HOMEPAGE="https://github.com/nonsequitur/inf-ruby"

EGIT_REPO_URI="https://github.com/nonsequitur/inf-ruby.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"
