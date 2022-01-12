# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.1"

MY_PN="${PN}.el"
inherit elisp

DESCRIPTION="GNU Emacs telegram client (unofficial)"
HOMEPAGE="https://zevlg.github.io/telega.el"

SRC_URI="https://github.com/zevlg/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="contrib dbus doc geo org standalone tray test"
# emerging with geo not tested
SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/${MY_PN}-${PV}"
DOCS="README.md"

# todo: tgs2png
BDEPEND="
	>=net-libs/tdlib-1.8.0
	sys-devel/make
	virtual/pkgconfig
	doc? ( app-emacs/ellit-org
		   >=app-emacs/htmlize-1.34
		   app-emacs/alert
		   app-emacs/all-the-icons
		   >=app-emacs/dashboard-1.8.0
		   app-emacs/esxml
		   >=app-emacs/rainbow-identifiers-0.2.2
		   app-emacs/transient
		   >=app-emacs/visual-fill-column-1.9 )
	org? ( || ( app-emacs/org app-emacs/org-mode app-editors/emacs[-minimal] ) )
	test? ( >=dev-lang/python-3 )
	tray? ( >=dev-libs/libappindicator-3 )
"

# todo: ensure visual-fill-column and rainbow-identifiers aren't needed at build time

# todo: try to run tests with -Q

# fixme: tray support will be built if libappindicator is installed,
# regardless of USE
RDEPEND="
	>=net-libs/tdlib-1.8.0
	>=app-emacs/visual-fill-column-1.9
	>=app-emacs/rainbow-identifiers-0.2.2
	contrib? ( app-emacs/alert
			   app-emacs/all-the-icons
			   app-emacs/dashboard
			   app-emacs/esxml
			   app-emacs/language-detection
			   app-emacs/transient )
	dbus? ( app-editors/emacs[dbus] )
	geo? ( app-emacs/geo )
	org? ( || ( app-emacs/org app-emacs/org-mode app-editors/emacs[-minimal] ) )
	standalone? ( app-emacs/company app-emacs/helm app-emacs/which-key )
	tray? ( >=dev-libs/libappindicator-3 )
"

src_prepare() {

	if use doc; then
		eapply "${FILESDIR}/${PN}"-0.8.0-fix-make-doc.patch
		eapply "${FILESDIR}/${PN}"-0.8.0-fix-make-doc-org-persist.patch
		cp "${FILESDIR}"/theme-readtheorg.setup docs
	fi

	if use test; then
		eapply "${FILESDIR}/${PN}"-0.8.0-no-installs-during-test.patch
		eapply "${FILESDIR}/${PN}"-0.8.0-fix-tests-bin-path.patch
	fi

	default
}

src_compile () {
	elisp_src_compile

	emake telega-server

	use doc && emake -j1 -C docs all && HTML_DOCS=( docs/*.html )

	use geo || rm contrib/telega-live-location.el
	use geo && elisp-compile contrib/telega-live-location.el
	use org && elisp-compile contrib/ol-telega.el

	use contrib && elisp-compile contrib/telega-*.el
}

src_install () {
	elisp_src_install

	# todo: maybe /usr/bin better be determined indirectly by some eclass?
	emake INSTALL_PREFIX="${D}/usr/bin" -C server install

	elisp-install "${PN}" -r etc

	use geo && elisp-install "${PN}" contrib/telega-live-location.{el,elc}
	use geo && rm contrib/telega-live-location*
	use org && elisp-install org contrib/ol-telega.{el,elc}
	rm contrib/ol-telega*
	use contrib && elisp-install "${PN}" contrib/*.{el,elc}

	if use standalone ; then
		elisp-install "${PN}" "${FILESDIR}"/telega-standalone.el
		dobin "${FILESDIR}"/telega-standalone.sh
	fi
}
