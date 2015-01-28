# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/php-apache:5.5 .
	adocker build -t azukiapp/php-apache:5.6 .

no-cache:
	adocker build --rm --no-cache -t azukiapp/php-apache:5.5 .
	adocker build --rm --no-cache -t azukiapp/php-apache:5.6 .
