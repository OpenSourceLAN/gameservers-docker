#!/bin/bash


ls armagetronad-*.src.tar.gz 2>/dev/null || (
	download_URL=$(curl http://www.armagetronad.org/downloads.php | grep -o "https://launchpad.net/armagetronad/.*/+download/armagetronad-.*.src.tar.gz")

	wget $download_URL
)