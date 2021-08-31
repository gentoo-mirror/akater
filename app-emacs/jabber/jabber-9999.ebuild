# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="A Jabber client for Emacs."
HOMEPAGE="https://github.com/legoscia/emacs-jabber"

EGIT_REPO_URI="https://github.com/legoscia/emacs-jabber.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
>=app-emacs/fsm-0.2
>=app-emacs/srv-0.2
"
