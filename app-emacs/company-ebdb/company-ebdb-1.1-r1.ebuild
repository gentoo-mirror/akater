# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elpa

DESCRIPTION="company-mode completion backend for EBDB in message-mode"

KEYWORDS="amd64 ~x86"

SLOT="0"

RDEPEND="
>=app-emacs/company-0.9.4
>=app-emacs/ebdb-0.2
"
