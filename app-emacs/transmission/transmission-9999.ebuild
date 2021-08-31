# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Emacs interface to a Transmission session"
HOMEPAGE="https://github.com/holomorph/transmission"

EGIT_REPO_URI="https://github.com/akater/transmission.git"
EGIT_BRANCH="improve-magnet-links-handling"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
