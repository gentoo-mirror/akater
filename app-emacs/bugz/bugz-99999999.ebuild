# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Emacs interface to Bugzilla"
HOMEPAGE="https://framagit.org/akater/emacs-bugz"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

# Settings for tests
# The minimal set of modules supported:
APACHE2_MODULES="authn_core authz_core authz_host dir mime unixd socache_shmcb"
# and cgi for testing elisp-bugz:
APACHE2_MODULES="${APACHE2_MODULES} cgi"
for module in ${APACHE2_MODULES}; do
	APACHE2_USE+=",apache2_modules_${module}"
done
APACHE2_USE="${APACHE2_USE:1}"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/eieio-akater-extras
	app-emacs/compat
	app-emacs/looking-through
	app-emacs/mmxx-macros
	app-emacs/shmu
	www-client/pybugz
"
RDEPEND="
	app-emacs/akater-misc
	app-emacs/eieio-akater-extras
	app-emacs/compat
	app-emacs/mmxx-macros
	app-emacs/shmu
	www-client/pybugz
"

DEPEND="test? ( app-emacs/ort
				www-apps/bugzilla[apache2,sqlite]
				www-servers/apache[${APACHE2_USE}]
				dev-perl/SOAP-Lite
				dev-perl/Test-Taint
				dev-perl/XMLRPC-Lite
)"
# TODO: Gentoo says install all three, Bugzilla only requires XMLRPC-Lite.
# Check if everything works with XMLRPC-Lite only.

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp-check-emacs-version
	default
}
