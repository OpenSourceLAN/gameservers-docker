#!/bin/bash


ls armagetronad-*.tbz 2>/dev/null || (
	download_URL=$(curl http://www.armagetronad.org/downloads.php | grep -o "https://launchpad.net/armagetronad/.*/+download/armagetronad-[^\"]*.tbz")

	wget $download_URL
)
