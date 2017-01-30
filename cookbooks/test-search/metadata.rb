name 'test-search'
maintainer 'kharkivdevops'
maintainer_email 'kuzma_rezchenko@epam.com'
license 'all_rights'
description 'Installs/Configures test-search'
long_description 'Installs/Configures test-search'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/test-search/issues' if respond_to?(:issues_url)
issues_url       'https://github.com/Kuzma975/cookbook-site/issues'
source_url       'https://github.com/Kuzma975/cookbook-site'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/test-search' if respond_to?(:source_url)
depends 'omnibus_updater', '~> 3.0.0'
