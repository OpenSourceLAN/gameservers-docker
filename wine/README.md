
This installs the wine-staging package and xfvb, a tool to make psueo-displays
so that apps which depend on X11 running can run without actual X displays,
such as when running inside a docker container.

No configuration options or start scripts.

You can easily update this to 2.2 by changing `wine-staging` to `wine-devel`
in the Dockerfile.