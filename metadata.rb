name 'docker'
maintainer 'Yadhu'
maintainer_email 'yadhu621@gmail.com'
license 'All Rights Reserved'
description 'Installs docker-ce'
long_description 'Installs/Configures docker-ce'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'magic_shell'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/kubernetes/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/kubernetes'
