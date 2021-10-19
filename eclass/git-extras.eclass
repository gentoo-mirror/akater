# Copyright 2002-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: elpa.eclass
# @MAINTAINER:
# Dima Akater <nuclearspace@gmail.com>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 7 8
# @BLURB: Extra functions for packages installed from git repositories
# @DESCRIPTION:
# Add features from branches

# EXPORT_FUNCTIONS git-merge

# @FUNCTION: git-merge
# @RETURN: ?
# @DESCRIPTION:
# Merge a git branch

git-merge() {
	local branch=${1}
	einfo "Merging branch ${branch}"
	git config user.email "portage@gentoohost.example"
	git config user.name "portage"
	git merge "${branch}" || die "Could not merge ${branch}"
}
