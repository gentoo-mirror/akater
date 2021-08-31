# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Pure elisp HTTP server"
HOMEPAGE="https://github.com/skeeto/emacs-http-server"

EGIT_REPO_URI="https://github.com/skeeto/emacs-http-server.git"
EGIT_BRANCH="master"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="README.md UNLICENSE"
