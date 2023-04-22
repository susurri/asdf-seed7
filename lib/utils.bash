#!/usr/bin/env bash

set -euo pipefail

SF_REPO="https://sourceforge.net/projects/seed7/files/seed7/"
TOOL_NAME="seed7"
TOOL_TEST="s7c -?"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opt=-fsSL

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	curl "${curl_opt}" "$SF_REPO" | grep 'span class="name">seed7' | sed -e 's/.*seed7_\([0-9_]*\).*/\1/' | sort_versions
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$SF_REPO/seed7_${version}/seed7_${version}.tgz/download"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opt}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="$3"
	local platform

	case "$OSTYPE" in
	darwin*) platform="darwin" ;;
	linux*) platform="linux" ;;
	*) fail "Unsupported platform" ;;
	esac

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		cd "$install_path"/src
		if [ "$platform" = "darwin" ]; then
			cp mk_osxcl.mak makefile
		fi
		make depend
		make
		make s7c
		cd ..
		rm -rf src

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
