# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elpa

DESCRIPTION="Sort and browse disk usage listings"

KEYWORDS="~amd64 ~x86"

SLOT="0"

RDEPEND="
		sys-apps/coreutils
"
