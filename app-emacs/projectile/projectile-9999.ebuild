# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Manage and navigate projects in Emacs easily"
HOMEPAGE="https://github.com/bbatsov/projectile"

EGIT_REPO_URI="https://github.com/bbatsov/projectile.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.md"

BDEPEND="test? ( app-emacs/buttercup )"
# todo: package buttercup
RDEPEND=">=app-emacs/pkg-info-0.4"
