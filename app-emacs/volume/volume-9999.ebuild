# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

DESCRIPTION="Tweak your sound card volume from Emacs"
HOMEPAGE="https://github.com/dbrock/volume-el"

EGIT_REPO_URI="https://github.com/dbrock/volume.el.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="mirror"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

# NOTE we might define the following which volume.el can work with by
# default, but volume.el can really work with anything.

# RDEPEND="|| ( media-sound/aumixer media-sound/alsa-utils )"

SITEFILE="50${PN}-gentoo.el"
