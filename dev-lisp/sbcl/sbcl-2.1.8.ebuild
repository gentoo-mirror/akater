# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib eutils flag-o-matic pax-utils toolchain-funcs

#same order as http://www.sbcl.org/platform-table.html
BV_X86=1.4.3
BV_AMD64=2.1.8
BV_PPC=1.2.7
BV_SPARC=1.0.28
BV_ALPHA=1.0.28
BV_ARM=1.4.11
BV_ARM64=1.4.2
BV_X64_MACOS=1.2.11
BV_PPC_MACOS=1.0.47
BV_X86_SOLARIS=1.2.7
BV_X64_SOLARIS=1.2.7
BV_SPARC_SOLARIS=1.0.23

DESCRIPTION="Steel Bank Common Lisp (SBCL) is an implementation of ANSI Common Lisp"
HOMEPAGE="http://sbcl.sourceforge.net/"
SRC_URI="mirror://sourceforge/sbcl/${P}-source.tar.bz2
	x86? ( mirror://sourceforge/sbcl/${PN}-${BV_X86}-x86-linux-binary.tar.bz2 )
	amd64? ( mirror://sourceforge/sbcl/${PN}-${BV_AMD64}-x86-64-linux-binary.tar.bz2 )
	ppc? ( mirror://sourceforge/sbcl/${PN}-${BV_PPC}-powerpc-linux-binary.tar.bz2 )
	sparc? ( mirror://sourceforge/sbcl/${PN}-${BV_SPARC}-sparc-linux-binary.tar.bz2 )
	alpha? ( mirror://sourceforge/sbcl/${PN}-${BV_ALPHA}-alpha-linux-binary.tar.bz2 )
	arm? ( mirror://sourceforge/sbcl/${PN}-${BV_ARM}-armhf-linux-binary.tar.bz2 )
	arm64? ( mirror://sourceforge/sbcl/${PN}-${BV_ARM64}-arm64-linux-binary.tar.bz2 )
	x64-macos? ( mirror://sourceforge/sbcl/${PN}-${BV_X64_MACOS}-x86-64-darwin-binary.tar.bz2 )
	ppc-macos? ( mirror://sourceforge/sbcl/${PN}-${BV_PPC_MACOS}-powerpc-darwin-binary.tar.bz2 )
	x86-solaris? ( mirror://sourceforge/sbcl/${PN}-${BV_X86_SOLARIS}-x86-solaris-binary.tar.bz2 )
	x64-solaris? ( mirror://sourceforge/sbcl/${PN}-${BV_X64_SOLARIS}-x86-64-solaris-binary.tar.bz2 )
	sparc-solaris? ( mirror://sourceforge/sbcl/${PN}-${BV_SPARC_SOLARIS}-sparc-solaris-binary.tar.bz2 )"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-solaris"
IUSE="bootstrap bootstrap-self abcl clisp clozurecl cmucl ecls debug gcl htmldoc sbcl source infodoc +threads +unicode pax-kernel zlib"

REQUIRED_USE="
	abcl?      (       !clisp !clozurecl !cmucl !ecls !gcl !sbcl )
	clisp?     ( !abcl        !clozurecl !cmucl !ecls !gcl !sbcl )
	clozurecl? ( !abcl !clisp            !cmucl !ecls !gcl !sbcl )
	cmucl?     ( !abcl !clisp !clozurecl        !ecls !gcl !sbcl )
	ecls?      ( !abcl !clisp !clozurecl !cmucl       !gcl !sbcl )
	gcl?       ( !abcl !clisp !clozurecl !cmucl !ecls      !sbcl )
	sbcl?      ( !abcl !clisp !clozurecl !cmucl !ecls !gcl       )
	bootstrap-self? ( bootstrap )
"

# bootstrap-self is not available with normal (non-bootstrap) install solely on the assumption that normal install would produce the output equivalent to what bootstrap-self would have produced

CDEPEND=">=dev-lisp/asdf-3.3.2-r1"
BDEPEND="
	bootstrap?
	( ||
	  (
		abcl? ( dev-lisp/abcl )
		clisp? ( dev-lisp/clisp )
		clozurecl? ( dev-lisp/clozurecl )
		cmucl? ( dev-lisp/cmucl )
		ecls? ( dev-lisp/ecls )
		gcl? ( dev-lisp/gcl )
		sbcl? ( dev-lisp/sbcl )
		( app-eselect/eselect-lisp
		  || ( dev-lisp/sbcl dev-lisp/clisp dev-lisp/clozurecl dev-lisp/cmucl dev-lisp/ecls dev-lisp/abcl dev-lisp/gcl ) )
	  )
	)
"
# at the time of writing, lisps enumerated in fallback section above get chosen in order in which they appear. This was the intent.
# clozurecl should arguably be the first choice for compilation after sbcl
# but I can't build it
# if ecl can build at all, it should be moved prior to clisp as it's more portable

# lisps that fail to compile sbcl should be masked at profile level, I believe

DEPEND="${CDEPEND} ${BDEPEND}
		htmldoc? ( sys-apps/texinfo >=media-gfx/graphviz-2.26.0 )
		infodoc? ( sys-apps/texinfo )
		pax-kernel? ( sys-apps/elfix )"
RDEPEND="${CDEPEND}
		!prefix? ( elibc_glibc? ( >=sys-libs/glibc-2.6 ) )"

# Disable warnings about executable stacks, as this won't be fixed soon by upstream
QA_EXECSTACK="usr/bin/sbcl"

CONFIG="${S}/customize-target-features.lisp"
ENVD="${T}/50sbcl"

# Prevent ASDF from using the system libraries
CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)"
ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)"

usep() {
	use ${1} && echo "true" || echo "false"
}

sbcl_feature() {
	echo "$( [[ ${1} == "true" ]] && echo "(enable ${2})" || echo "(disable ${2})")" >> "${CONFIG}"
}

sbcl_apply_features() {
	sed 's/^X//' > "${CONFIG}" <<-'EOF'
	(lambda (list)
	X  (flet ((enable  (x) (pushnew x list))
	X         (disable (x) (setf list (remove x list))))
	EOF
	if use x86 || use amd64; then
		sbcl_feature "$(usep threads)" ":sb-thread"
	fi
	sbcl_feature "true" ":sb-ldb"
	sbcl_feature "false" ":sb-test"
	sbcl_feature "$(usep unicode)" ":sb-unicode"
	sbcl_feature "$(usep zlib)" ":sb-core-compression"
	sbcl_feature "$(usep debug)" ":sb-xref-for-internals"
	sed 's/^X//' >> "${CONFIG}" <<-'EOF'
	X    )
	X  list)
	EOF
	cat "${CONFIG}"
}

pkg_pretend() {
	if use bootstrap        &&
			! use abcl      &&
			! use clisp     &&
			! use clozurecl &&
			! use cmucl     &&
			! use ecls      &&
			! use gcl       &&
			! use sbcl      &&
			[[ ! -f /usr/bin/lisp ]] ; then
		ewarn "You are compiling with default lisp but it is not set."
		ewarn "Please call"
		ewarn "eselect lisp update"
		ewarn "and resume emerge then."
		die "No /usr/bin/lisp symlink found"
	fi
}

src_unpack() {
	unpack ${A}
	if ! use bootstrap ; then
	   mv sbcl-*-* sbcl-binary || die
	fi
	cd "${S}"
}

src_prepare() {
	# bug #468482
	eapply "${FILESDIR}"/concurrency-test-2.0.1.patch
	# bugs #486552, #527666, #517004
	eapply "${FILESDIR}"/bsd-sockets-test-2.0.5.patch
	# bugs #560276, #561018
	eapply "${FILESDIR}"/sb-posix-test-1.2.15.patch
	# bug #767742
	eapply "${FILESDIR}"/etags-2.1.0.patch

	eapply "${FILESDIR}"/verbose-build-2.0.3.patch

	use elibc_uclibc && eapply "${FILESDIR}"/${PN}-1.5.8-uclibc-fix.patch
	# will this work correctly for cross-compilation? there's also
	# [[ $CHOST == *-uclibc ]] && eapply "${FILESDIR}"/uclibc-fix.patch

	eapply_user

	# Make sure the *FLAGS variables are sane.
	# sbcl needs symbols in resulting binaries, so building with the -s linker flag will fail.
	strip-unsupported-flags
	filter-flags -fomit-frame-pointer -Wl,-s
	filter-ldflags -s

	# original bugs #526194, #620532
	# this broke no-pie default builds, c.f. bug #632670
	# Pass CFLAGS down by appending our value, to let users override
	# the default values.
	# Keep passing LDFLAGS down via the LINKFLAGS variable.
	sed -e "s@\(CFLAGS += -g .*\)\$@\1 ${CFLAGS}@" \
		-e "s@LINKFLAGS += -g\$@LINKFLAGS += ${LDFLAGS}@" \
		-i src/runtime/GNUmakefile || die

	sed -e "s@SBCL_PREFIX=\"/usr/local\"@SBCL_PREFIX=\"${EPREFIX}/usr\"@" \
		-i make-config.sh || die

	# Use installed ASDF version
	cp "${EPREFIX}"/usr/share/common-lisp/source/asdf/build/asdf.lisp contrib/asdf/ || die
	# Avoid installation of ASDF info page. See bug #605752
	sed '/INFOFILES/s/asdf.info//' -i doc/manual/Makefile || die

	use source && sed 's%"$(BUILD_ROOT)%$(MODULE).lisp "$(BUILD_ROOT)%' -i contrib/vanilla-module.mk

	# Some shells(such as dash) don't have "time" as builtin
	# and we don't want to DEPEND on sys-process/time
	sed "s,^time ,," -i make.sh || die
	sed "s,/lib,/$(get_libdir),g" -i install.sh || die
	# #define SBCL_HOME ...
	sed "s,/usr/local/lib,${EPREFIX}/usr/$(get_libdir),g" -i src/runtime/runtime.c || die
	# change location of /etc/sbclrc ...
	sed  "s,/etc/sbclrc,${EPREFIX}/etc/sbclrc,g" -i src/code/toplevel.lisp || die

	find . -type f -name .cvsignore -delete
}

src_configure() {
	# customizing SBCL version as per
	# http://sbcl.cvs.sourceforge.net/sbcl/sbcl/doc/PACKAGING-SBCL.txt?view=markup
	echo -e ";;; Auto-generated by Gentoo\n\"gentoo-${PR}\"" > branch-version.lisp-expr

	# applying customizations
	sbcl_apply_features
}

# I can't make this function work for some stupid bash related reasons
with_cleared_env() {
	# clear the environment to get rid of non-ASCII strings, see bug #174702
	# set HOME for paludis
	env - HOME="${T}" PATH="${PATH}" \
		CC="$(tc-getCC)" AS="$(tc-getAS)" LD="$(tc-getLD)" \
		CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" ASFLAGS="${ASFLAGS}" LDFLAGS="${LDFLAGS}" \
		GNUMAKE=make "$@"
	}

src_compile() {
	local bindir="${WORKDIR}"/sbcl-binary

	if use pax-kernel ; then
		# To disable PaX on hardened systems
		pax-mark -mr "${bindir}"/src/runtime/sbcl

		# Hack to disable PaX on second GENESIS stage
		# note: this could fail on uclibc, do check
		sed -i -e '/^[ \t]*echo \/\/doing warm init - compilation phase$/a\    paxmark.sh -mr \.\/src\/runtime\/sbcl' \
			"${S}"/make-target-2.sh || die "Cannot disable PaX on second GENESIS runtime"
	fi

	# todo: abstract “clear the environment” below into a function
	if use bootstrap ; then
		if   use abcl ; then
			local compiler="abcl"
		elif use clisp ; then
			local compiler="clisp"
		elif use clozurecl ; then
			local compiler="ccl"
		elif use cmucl ; then
			local compiler="cmucl"
		elif use ecls ; then
			local compiler="ecl"
		elif use gcl ; then
			local compiler="gcl"
		elif use sbcl ; then
			local compiler="sbcl"
		else
			local compiler="lisp"
		fi

		if [[ ${compiler} == "lisp" ]] ; then
			local resolved_compiler="$(basename $(readlink -f /usr/bin/lisp))"
		else
			local resolved_compiler=${compiler}
		fi

		einfo "SBCL is going to be compiled with ${resolved_compiler}"
		if use bootstrap-self ; then
			einfo "It will then recompile itself"
		fi

		# I guess, tests are also performed here but they should not
		env - HOME="${T}" PATH="${PATH}" \
			CC="$(tc-getCC)" AS="$(tc-getAS)" LD="$(tc-getLD)" \
			CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" ASFLAGS="${ASFLAGS}" LDFLAGS="${LDFLAGS}" \
			GNUMAKE=make ./make.sh "${compiler}" \
			|| die "Bootstrapping sbcl with ${resolved_compiler} failed"
		einfo "Bootstrapping sbcl with ${resolved_compiler} succeeded"

		if use bootstrap-self ; then

			einfo "Recompiling sbcl with itself"

			mkdir -p "${T}"/src/runtime
			mv "${S}"/src/runtime/sbcl "${T}"/src/runtime/sbcl
			mkdir "${T}"/output
			mv "${S}"/output/sbcl.core "${T}"/output/sbcl.core

			# todo: disable PaX here too
			# todo: check if fasl cache, if there was any, does get cleared here
			env - HOME="${T}" PATH="${PATH}" \
				CC="$(tc-getCC)" AS="$(tc-getAS)" LD="$(tc-getLD)" \
				CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" ASFLAGS="${ASFLAGS}" LDFLAGS="${LDFLAGS}" \
				GNUMAKE=make ./make.sh \
							 "${T}/src/runtime/sbcl \
							 --core ${T}/output/sbcl.core \
							 --no-sysinit --no-userinit --disable-debugger" \
				|| die "Self-recompliation failed"
			einfo "Self-recompilation succeeded"

		fi
	else
		## unfortunately, the following just doesn't work for stupid bash syntax
		## related reasons
		# with_cleared_env ./make.sh \
		# 				 "sh ${bindir}/run-sbcl.sh --no-sysinit --no-userinit --disable-debugger" \

		env - HOME="${T}" PATH="${PATH}" \
			CC="$(tc-getCC)" AS="$(tc-getAS)" LD="$(tc-getLD)" \
			CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" ASFLAGS="${ASFLAGS}" LDFLAGS="${LDFLAGS}" \
			GNUMAKE=make ./make.sh \
			"sh ${bindir}/run-sbcl.sh --no-sysinit --no-userinit --disable-debugger" \
			|| die "make failed"
	fi

	# need to set HOME because libpango(used by graphviz) complains about it
	if use htmldoc && use infodoc; then
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/manual info html || die "Cannot build manual"
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/internals info html || die "Cannot build internal docs"
		elif use infodoc; then
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/manual info || die "Cannot build manual"
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/internals info || die "Cannot build internal docs"
		elif use htmldoc; then
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/manual html || die "Cannot build manual"
		env - HOME="${T}" PATH="${PATH}" \
			CL_SOURCE_REGISTRY="(:source-registry :ignore-inherited-configuration)" \
			ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration)" \
			make -C doc/internals html || die "Cannot build internal docs"
	fi
}

src_test() {
	ewarn "Unfortunately, it is known that some tests fail eg."
	ewarn "run-program.impure.lisp. This is an issue of the upstream's"
	ewarn "development and not of Gentoo's side. Please, before filing"
	ewarn "any bug(s) search for older submissions. Thank you."
	time ( cd tests && sh run-tests.sh )
}

src_install() {
	# install system-wide initfile
	dodir /etc/
	sed 's/^X//' > "${ED}"/etc/sbclrc <<-EOF
	;;; The following is required if you want source location functions to
	;;; work in SLIME, for example.
	X
	(setf (logical-pathname-translations "SYS")
	X      '(("SYS:SRC;**;*.*.*" #p"${EPREFIX}/usr/$(get_libdir)/sbcl/src/**/*.*")
	X        ("SYS:CONTRIB;**;*.*.*" #p"${EPREFIX}/usr/$(get_libdir)/sbcl/**/*.*")))
	X
	;;; Setup ASDF2
	(load "${EPREFIX}/etc/common-lisp/gentoo-init.lisp")
	EOF

	# Install documentation
	unset SBCL_HOME
	INSTALL_ROOT="${ED}/usr" LIB_DIR="${EPREFIX}/usr/$(get_libdir)" DOC_DIR="${ED}/usr/share/doc/${PF}" \
		sh install.sh || die "install.sh failed"

	# bug #517008
	pax-mark -mr "${D}"/usr/bin/sbcl

	# rm empty directories lest paludis complain about this
	find "${ED}" -empty -type d -exec rmdir -v {} +

	if use htmldoc || use infodoc; then
		# dodoc -r doc/internals/sbcl-internals
		# I do not know what I'm doing but it works for me

		doinfo doc/manual/*.info*
		doinfo doc/internals/sbcl-internals.info

		docinto internals-notes
		dodoc doc/internals-notes/*
	else
		rm -Rv "${ED}/usr/share/doc/${PF}" || die
	fi

	# install the SBCL source
	if use source; then
		./clean.sh
		cp -av src "${ED}/usr/$(get_libdir)/sbcl/" || die
		for d in contrib/*/; do
				cp -av "$d" "${ED}/usr/$(get_libdir)/sbcl/" || die
		done

	fi

	# necessary for running newly-saved images
	echo "SBCL_HOME=${EPREFIX}/usr/$(get_libdir)/${PN}" > "${ENVD}"
	echo "SBCL_SOURCE_ROOT=${EPREFIX}/usr/$(get_libdir)/${PN}/src" >> "${ENVD}"
	doenvd "${ENVD}"
}

# pkg_postinst() {
# 	dosym /usr/share/common-lisp/source/asdf/build $SBCL_HOME/asdf || die "Could not create asdf symlink in $SBCL_HOME"
# 	has eselect-lisp &&
# 		[[ ! $(baseline $(readlink -f /usr/bin/lisp)) == sbcl ]] &&
# 		einfo "You might want to eselect lisp set sbcl now."
# }
