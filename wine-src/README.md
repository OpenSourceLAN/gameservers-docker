
This installs the wine 2.0 by compiling from source, and the xfvb package, a tool to make psueo-displays
so that apps which depend on X11 running can run without actual X displays,
such as when running inside a docker container.

No configuration options or start scripts.

You can easily update this to use 2.2 by doing `sed -i 's/2\.0/2.2/' Dockerfile`