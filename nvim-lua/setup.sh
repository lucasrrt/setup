#!/bin/sh

find -type d -exec mkdir --parents -- "$DESTDIR"/{} \;

find -type f -exec ln --symbolic -- "$SOURCEDIR"/{} "$DESTDIR"/{} \;
