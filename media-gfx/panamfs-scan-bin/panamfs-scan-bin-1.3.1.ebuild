# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop prefix

DESCRIPTION="Panasonic MFS Scanner Driver"
HOMEPAGE="https://panasonic.net/cns/pcc/support/fax/common/table/linuxdriver.html"
SRC_URI="
	x86? ( https://www.psn-web.net/cs/support/fax/common/file/Linux_ScanDriver/panamfs-scan-1.3.1-i686.tar.gz -> ${P}-i686.tar.gz )
	amd64? ( https://www.psn-web.net/cs/support/fax/common/file/Linux_ScanDriver/panamfs-scan-1.3.1-x86_64.tar.gz -> ${P}-x86_64.tar.gz )
"
RESTRICT="mirror"

LICENSE="Panasonic-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gui"

BDEPEND="
	sys-libs/glibc
	dev-libs/libusb-compat
	gui? ( x11-libs/gtk+
		   x11-libs/gdk-pixbuf
		   dev-libs/glib )
"
RDEPEND="
	${BDEPEND}
	media-gfx/sane-backends
"

src_unpack() {
	unpack "${A}"

	if use amd64; then
		mv "${WORKDIR}"/panamfs-scan-1.3.1-x86_64 "${WORKDIR}/${P}"
	elif use x86; then
		mv "${WORKDIR}"/panamfs-scan-1.3.1-i686 "${WORKDIR}/${P}"
	else die "Architecture not supported";
	fi
}

src_prepare() {
	cp "${FILESDIR}/50-${PN}" "${T}"
	eprefixify "${T}/50-${PN}"
	default
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	local dest=/opt/panasonic/scanner
	local lib=$(get_libdir)
	# we follow the upstream's installer terminology
	local INSTALL_PATH="${dest}"
	local INSTALL_SANE_DATA_PATH="${dest}"

	# todo: maybe symlink /usr/share/panasonic/scanner to /opt/panasonic/scanner
	# libs and bins are there
	# but on my system there are some executables in /usr/share

	into ${dest}

	dolib.so sane-backend/libsane-panamfs.so.${PV}
	dosym -r {${dest}/${lib},/usr/${lib}/sane}/libsane-panamfs.so.${PV}
	dosym -r ${dest}/${lib}/libsane-panamfs.so.${PV} ${dest}/${lib}/libsane-panamfs.so.1
	dosym -r ${dest}/${lib}/libsane-panamfs.so.1 ${dest}/${lib}/libsane-panamfs.so
	dosym -r /usr/${lib}/sane/libsane-panamfs.so.${PV} /usr/${lib}/sane/libsane-panamfs.so.1
	dosym -r /usr/${lib}/sane/libsane-panamfs.so.1 /usr/${lib}/sane/libsane-panamfs.so

	insinto /etc/revdep-rebuild && doins "${T}/50-${PN}"

	insinto /etc/sane.d
	doins "${S}"/sane-backend/panamfs.conf

	# todo: something with etc/sane.d/dll.conf
	# some other ebuild did
	# insinto /etc/sane.d/dll.d
	# newins - ${PN} <<< "panamfs"

	# # upstream installer writes to /etc/sane.d/dll.conf
	# # how do we write with portage?
	# # also, media-gfx/sane-backends should be in bdepend
	# # if we want it at install time
	# if test -f /etc/sane.d/dll.conf
	# then
	# 	sed -i 's/^panamfs$//' /etc/sane.d/dll.conf
	# 	echo "panamfs" >> /etc/sane.d/dll.conf
	# fi

	for lang in cs de en en_GB es fr fr_CA it ja pl pt pt_BR pt_PT ru zh_CN zh_TW ; do
		insinto "${INSTALL_SANE_DATA_PATH}/data/${lang}"
		doins "${S}/sane-backend/po/sane-panamfs.${lang}.po"
		# files sane-backend/po/sane-backends.*.po are apparently ignored by the upstream installer
	done

	if use gui ; then

		INSTALL_PATH="${dest}"
		# this is done by the upstream installer
		keepdir $INSTALL_PATH/conf

		DESTTREE=${INSTALL_PATH}
		into "${DESTTREE}"
		dobin "${S}"/app/PanasonicMFSTools

		INSDESTTREE="${dest}"
		insinto "${INSDESTTREE}" && doins Version.html

		# Upstream installs the icon into bin subdirectory
		insinto "${DESTTREE}/bin"
		doins "${S}"/app/PanasonicMFSTools.png

		sed -i 's:/usr/local/share/:/opt/:g' "${S}"/app/PanasonicMFSTools.desktop
		domenu "${S}"/app/PanasonicMFSTools.desktop

		insinto "${INSDESTTREE}"/data
		doins -r "${S}"/app/res/*

		dobin "${S}"/app/PanasonicMFSscan

		INSTALL_BIN_PATH="/usr/bin"
		dosym $INSTALL_PATH/bin/PanasonicMFSscan $INSTALL_BIN_PATH/PanasonicMFSscan

	fi

	INSTALL_PATH="${dest}"
	into "${DESTTREE}"

	dobin "${S}"/lpd/PanasonicMFSlpd
	dobin "${S}/"server/PanasonicMFSpushd
	dobin "${S}"/killserver/killpanasonicmfspushd

	sed -i 's:/usr/local/share/:/opt/:g' "${S}"/killserver/killpanasonicmfspushd.sh
	dobin "${S}"/killserver/killpanasonicmfspushd.sh

	# this .desktop is copied by upstream installer to /etc/xdg/autostart
	sed -i 's:/usr/local/share/:/opt/:g' "${S}"/server/PanasonicMFSpushd.desktop
	domenu "${S}"/server/PanasonicMFSpushd.desktop

	# some binaries refer to local/share
	# but doing
	# dosym /opt/panasonic/scanner /usr/local/share/panasonic/scanner
	# means installing into /usr/local
	# which is against Gentoo policies

	# init scripts

	sed -i 's:/usr/local/share/:/opt/:g' "${S}"/lpd/panasoniclpd-init

	doinitd "${S}"/lpd/panasoniclpd-init
	dosym -r /etc/init.d/panasoniclpd-init /etc/rc2.d/S80panasoniclpd-init
	dosym -r /etc/init.d/panasoniclpd-init /etc/rc3.d/S80panasoniclpd-init
	dosym -r /etc/init.d/panasoniclpd-init /etc/rc4.d/S80panasoniclpd-init
	dosym -r /etc/init.d/panasoniclpd-init /etc/rc5.d/S80panasoniclpd-init

	# todo: init scripts for gdm lightdm

}
