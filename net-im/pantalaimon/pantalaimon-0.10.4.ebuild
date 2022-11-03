# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="A Matrix proxy daemon that adds E2E encryption capabilities"
HOMEPAGE="https://github.com/matrix-org/pantalaimon"
SRC_URI="https://github.com/matrix-org/pantalaimon/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dbus panctl systemd test"
RESTRICT="mirror"
DOCS=( "README.md" "docs/man/pantalaimon.5.md" "docs/man/pantalaimon.8.md" )
REQUIRED_USE="panctl? ( dbus )"

BDEPEND=""
RDEPEND="
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/cachetools-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/janus-0.5[${PYTHON_USEDEP}]
	>=dev-python/keyring-21.2.1[${PYTHON_USEDEP}]
	>=dev-python/logbook-1.5.3[${PYTHON_USEDEP}]
	>=dev-python/matrix-nio-0.18[e2e(+),${PYTHON_USEDEP}]
	<dev-python/matrix-nio-0.20[e2e(+),${PYTHON_USEDEP}]
	>=dev-python/peewee-3.13.1[${PYTHON_USEDEP}]
	>dev-python/prompt_toolkit-2[${PYTHON_USEDEP}]
	<dev-python/prompt_toolkit-4[${PYTHON_USEDEP}]
	dbus? (
			>=dev-python/dbus-python-1.2[${PYTHON_USEDEP}]
			<dev-python/dbus-python-1.3[${PYTHON_USEDEP}]
			>=dev-python/notify2-0.3[${PYTHON_USEDEP}]
			<dev-python/notify2-0.4[${PYTHON_USEDEP}]
			>=dev-python/pydbus-0.6[${PYTHON_USEDEP}]
			<dev-python/pydbus-0.7[${PYTHON_USEDEP}]
			>=dev-python/pygobject-3.36[${PYTHON_USEDEP}]
			)
"
# lets relax the dependency
#	<dev-python/pygobject-3.40[${PYTHON_USEDEP}]
BDEPEND="
	test? (
		${RDEPEND}
	)
"

src_prepare() {

	# I don't think we should install something a priori non-functioning

	if ! use panctl ; then
		rm docs/man/panctl.1
		rm docs/man/panctl.md
		rm pantalaimon/panctl.py
		eapply "${FILESDIR}/${PN}"-0.10.2-no-panctl.patch
	fi

	default
}

# todo: Why exactly is compilation disabled by upstream?
distutils_enable_tests pytest

src_install() {
	# Remove some warnings
	ln -s docs doc
	# This should probably be addressed by upstream

	distutils-r1_src_install
	doman docs/man/pantalaimon.{5,8}
	if use panctl ; then
		doman docs/man/panctl.1
		dodoc docs/man/panctl.md
	fi

	# issue: contrib config could be much better
	sed -i -e 's/^/# /' contrib/pantalaimon.conf
	# src_prepare-overlay suggests:
	# sed -i 's/^/# /' contrib/pantalaimon.conf || die
	insinto /etc
	doins contrib/pantalaimon.conf

	if use systemd; then
		insinto /usr/lib/systemd/user
		doins contrib/pantalaimon.service
	fi

}
