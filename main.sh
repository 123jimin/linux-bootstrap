#!/usr/bin/env bash

# Check if the distro is Debian-based
if ! lsb_release -a 2>/dev/null | grep -q "Distributor ID:\s*Debian"; then
    echo "This script is intended to be run on Debian-based distros."
    exit 1
fi

# Check for missing packages
essential_packages=("git" "gcc" "curl")
essential_packages_str="${essential_packages[@]}"
installed_packages=$(dpkg-query -W -f='${Package}\n' "$essential_packages_str" 2>/dev/null)

for pkg in "${essential_packages[@]}"; do
    if ! grep -q "^$pkg$" <<< "$installed_packages"; then
        missing_packages+=("$pkg")
    fi
done

echo "${missing_packages[@]}"

cleanup() {
    echo "Cleaning up..."
    rm -rf "$tmp_dir"
}

trap cleanup EXIT

tmp_dir=$(mktemp -d)

# Check whether essential pacakges are installed.