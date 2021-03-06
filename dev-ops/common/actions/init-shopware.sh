#!/usr/bin/env bash
#DESCRIPTION: initialization of shopware

bin/console framework:create:tenant --tenant-id=ffffffffffffffffffffffffffffffff

bin/console translation:import --with-plugins --tenant-id=ffffffffffffffffffffffffffffffff

bin/console plugin:update

bin/console rest:user:create admin --password=shopware --tenant-id=ffffffffffffffffffffffffffffffff

php bin/console application:create:storefront __APP_URL__ --tenant-id=ffffffffffffffffffffffffffffffff

php bin/console cache:clear
