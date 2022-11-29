# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=KIWANAMI
DIST_VERSION=v0.0.11
inherit perl-module

DESCRIPTION="An Asynchronous Remote Procedure Stack"
RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86 ~amd64-linux ~x86-linux"

BDEPEND="dev-perl/Module-Build"
RDEPEND="
	dev-perl/AnyEvent
	dev-perl/Data-SExpression
"
