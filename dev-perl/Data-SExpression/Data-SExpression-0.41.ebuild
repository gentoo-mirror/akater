# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=NELHAGE
DIST_VERSION=0.41
inherit perl-module

DESCRIPTION="Parse Lisp S-Expressions into perl data structures."
RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86 ~amd64-linux ~x86-linux"

BDEPEND="dev-perl/Module-Install"
RDEPEND="
	dev-perl/Class-Accessor
"
