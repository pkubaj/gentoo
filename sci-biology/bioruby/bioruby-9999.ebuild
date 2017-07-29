# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21"
EGIT_REPO_URI="https://github.com/bioruby/bioruby.git"

inherit git-2 ruby-fakegem

DESCRIPTION="An integrated environment for bioinformatics using the Ruby language"
LICENSE="Ruby"
HOMEPAGE="http://bioruby.org/"
SRC_URI=""
SLOT="0"
IUSE=""
KEYWORDS=""

ruby_add_rdepend "dev-ruby/libxml"

all_ruby_unpack() {
	git-2_src_unpack
}

each_ruby_configure() {
	${RUBY} setup.rb config || die
}

each_ruby_compile() {
	${RUBY} setup.rb setup || die
}

each_ruby_install() {
	${RUBY} setup.rb install --prefix="${D}" || die
}

each_ruby_test() {
	${RUBY} -rubygems test/runner.rb || die
}
