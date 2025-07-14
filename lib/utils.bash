#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/open-telemetry/opentelemetry-collector-releases"
TOOL_NAME="otelcol"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

get_platform() {
	uname | tr '[:upper:]' '[:lower:]'
}

get_arch() {
	local machine_hardware_name
	machine_hardware_name="$(uname -m)"

	case "$machine_hardware_name" in
	'x86_64') local cpu_type="amd64" ;;
	'powerpc64le' | 'ppc64le') local cpu_type="ppc64le" ;;
	'aarch64') local cpu_type="arm64" ;;
	'armv7l') local cpu_type="arm" ;;
	*) local cpu_type="$machine_hardware_name" ;;
	esac
	echo "$cpu_type"
}

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	list_github_tags
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

otelcol_dist=${ASDF_OTELCOL_DISTRIBUTION:-contrib}
otelcol_bin="otelcol"
if [[ "$otelcol_dist" != "core" ]]; then
	otelcol_bin="otelcol-$otelcol_dist"
fi

download_release() {
	local version
	version="$1"
	local filename
	filename="$2"
	local platform
	platform="$(get_platform)"
	local arch
	arch="$(get_arch)"

	local url
	url="$GH_REPO/releases/download/v${version}/${otelcol_bin}_${version}_${platform}_${arch}.tar.gz"

	echo "* Downloading $otelcol_bin release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		test -x "$install_path/$otelcol_bin" || fail "Expected $install_path/$otelcol_bin to be executable."

		if [[ "$otelcol_bin" != "otelcol" ]]; then
			mv "$install_path/$otelcol_bin" "$install_path/otelcol"
		fi
			
		echo "$otelcol_bin $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
