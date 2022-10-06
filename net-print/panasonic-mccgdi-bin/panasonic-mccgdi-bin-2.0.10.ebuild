# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop prefix

DESCRIPTION="Panasonic Multi-Function Printers drivers"
HOMEPAGE="https://panasonic.net/cns/pcc/support/fax/common/table/linuxdriver.html"
SRC_URI="
	x86? ( https://www.psn-web.net/cs/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/mccgdi-2.0.10-i686.tar.gz -> ${P}-i686.tar.gz )
	amd64? ( https://www.psn-web.net/cs/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/mccgdi-2.0.10-x86_64.tar.gz -> ${P}-x86_64.tar.gz )
"
RESTRICT="mirror"

LICENSE="Panasonic-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gui"

BDEPEND="
	sys-libs/glibc
	gui? ( dev-libs/atk
		   x11-libs/cairo
		   x11-libs/gtk+
		   x11-libs/gdk-pixbuf
		   dev-libs/glib
		   x11-libs/pango )
"
RDEPEND="
	${BDEPEND}
	net-print/cups
"

src_unpack() {
	unpack "${A}"

	if use amd64; then
		mv "${WORKDIR}"/mccgdi-2.0.10-x86_64 "${WORKDIR}/${P}"
	elif use x86; then
		mv "${WORKDIR}"/mccgdi-2.0.10-i686 "${WORKDIR}/${P}"
	else die "Architecture not supported";
	fi
}

QA_FLAGS_IGNORED="usr/libexec/cups/filter/L_H0JDGCZAZ"
QA_PRESTRIPPED="/opt/panasonic/printer/bin/L_H0JDUCZAZ
				/opt/panasonic/printer/bin/L_H0JDUIZAZ
				/usr/libexec/cups/filter/L_H0JDGCZAZ
				/usr/lib/L_H0JDJCZAZ_2.so.1.0.0
				/usr/lib/L_H0JDJCZAZ.so.1.0.0
				/usr/lib32/L_H0JDJCZAZ_2.so.1.0.0
				/usr/lib32/L_H0JDJCZAZ.so.1.0.0
				/usr/lib64/L_H0JDJCZAZ_2.so.1.0.0
				/usr/lib64/L_H0JDJCZAZ.so.1.0.0
"

src_prepare() {
	cp "${FILESDIR}/50-${PN}" "${T}"
	eprefixify "${T}/50-${PN}"
	default
}

src_install() {

	dolib.so lib/L_H0JDJCZAZ.so.1.0.0
	dolib.so lib/L_H0JDJCZAZ_2.so.1.0.0
	insinto /etc/revdep-rebuild && doins "${T}/50-${PN}"

	insinto /usr/share/cups/model
	exeinto /usr/libexec/cups/filter

	doins "${S}"/ppd/*
	doexe "${S}"/filter/L_H0JDGCZAZ

	if use gui ; then

		# this should be removed
		DESTTREE="/opt/panasonic/printer"

		into "/opt/panasonic/printer"
		dobin "${S}/panautil/L_H0JDUIZAZ"
		dobin "${S}/panautil/L_H0JDUCZAZ"

		insinto "/opt/panasonic/printer" && doins Version.html

		# this
		insinto "${DESTTREE}/data"
		# should be replaced with something like
		# insinto "data"
		# but relative path does not work the expected way
		doins -r data/*

		# Upstream installs the icon into bin subdirectory
		# this
		insinto "${DESTTREE}/bin"
		# should be replaced with something like
		# insinto "bin"
		# but relative path does not work the expected way
		doins "${S}/panautil/L_H0JDUIZAZ.png"

		# diropts 777
		# this
		keepdir "${DESTTREE}/conf"
		# should be replaced with something like
		# keepdr "conf"
		# but relative path does not work the expected way
		keepdir "/var/spool/.panamfs"

		sed -i 's:/usr/local/share/:/opt/:g' "${S}/panautil/L_H0JDUIZAZ.desktop"
		domenu "${S}/panautil/L_H0JDUIZAZ.desktop"

	fi
}

pkg_postinst() {
	einfo
	elog "Please restart cups service"
}
