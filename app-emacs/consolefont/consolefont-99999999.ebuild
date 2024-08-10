# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Change console font with from Emacs, with OpenRC or systemd"
HOMEPAGE="https://framagit.org/akater/emacs-consolefont"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="systemd test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/shmu[privileged]
	app-emacs/akater-misc
	app-emacs/akater-conf
"
RDEPEND="
	systemd? ( sys-apps/systemd )
	!systemd? ( sys-apps/openrc )
	app-emacs/shmu[privileged]
	app-emacs/akater-conf
"

DEPEND="test? ( app-emacs/ort )"

SITEFILE="50${PN}-gentoo.el"
