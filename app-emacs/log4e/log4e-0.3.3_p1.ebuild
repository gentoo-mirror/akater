# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Logging framework for Elisp"
HOMEPAGE="https://github.com/aki2o/log4e"

EGIT_REPO_URI="https://github.com/aki2o/log4e.git"
EGIT_CLONE_TYPE="single+tags"
EGIT_COMMIT="737d275eac28dbdfb0b26d28e99da148bfce9d16"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
