# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

ELPA_CONTAINER_KIND=tar

inherit elpa

DESCRIPTION="Modular text completion framework"

KEYWORDS="amd64 ~arm ~arm64 ~x86"

SLOT="0"

SITEFILE="50${PN}-gentoo.el"
