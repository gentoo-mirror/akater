# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: akater-live-release.eclass
# @MAINTAINER:
# Dima Akater <nuclearspace@gmail.com>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 4 5 6 7 8
# @BLURB: Just set some variables specific to my live ebuilds
# @DESCRIPTION:
# I use release branch live packages offered to others
# but master branch on my own.  This eclass is meant to make this smooth.
#
# The eclass sets default branch to release
# unless specified otherwise by user
# by setting AKATER_LIVE_BRANCH
#
# It also sets ORG_LOCAL_SOURCES_DIRECTORY
# whenever ORG_LOCAL_SOURCES_PREFIX is set.
# That's it.

inherit git-r3

EGIT_BRANCH=${AKATER_LIVE_BRANCH=release}

MY_PN=${MY_PN=${PN}}

if [ ! -z ${ORG_LOCAL_SOURCES_PREFIX+x} ] ; then
	export ORG_LOCAL_SOURCES_DIRECTORY=${ORG_LOCAL_SOURCES_PREFIX}/${MY_PN}
fi

export ORG_UPSTREAM_SOURCES_DIRECTORY="${SITEETC}/${PN}"
# deprecated name:
export ORG_IMMUTABLE_SOURCES_DIRECTORY="${SITEETC}/${PN}"
