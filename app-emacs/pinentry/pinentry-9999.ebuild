# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elpa

DESCRIPTION="GnuPG Pinentry server implementation"

KEYWORDS="~amd64 ~x86"

SLOT="0"

RDEPEND="
		>=app-crypt/gnupg-2.1.5
"
