# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="Python CFFI binding to libolm"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm/"
SRC_URI="https://gitlab.matrix.org/matrix-org/olm/-/archive/${PV}/olm-${PV}.tar.bz2 -> ${P}.tar.bz2"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="Apache-2.0"

S="${S}/python"

CDEPEND="
	>=dev-libs/olm-${PV}
"

BDEPEND="${CDEPEND}
	dev-python/cffi
	dev-python/wheel
"
RDEPEND="${CDEPEND}"
