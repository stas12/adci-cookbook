maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures phpapp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "nginx"
depends "php"
depends "php-fpm"
depends "openssl"
depends "ohai"
depends "build-essential"
depends "mysql"
