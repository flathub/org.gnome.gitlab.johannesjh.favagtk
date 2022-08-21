# This makefile helps remember the commands for local flatpak builds and subsequent local testing

.PHONY: build
build:
	flatpak-builder --verbose --force-clean --repo=_repo _build org.gnome.gitlab.johannesjh.favagtk.json

.PHONY: run
run: build
	flatpak-builder --verbose --run _build org.gnome.gitlab.johannesjh.favagtk.json favagtk

dist: build
dist:
	flatpak build-bundle --verbose _repo favagtk.flatpak org.gnome.gitlab.johannesjh.favagtk

