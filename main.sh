#!/usr/bin/env bash

# Check if the distro is Debian-based
if ! lsb_release -a 2>/dev/null | grep -q "Distributor ID:\s*Debian"; then
    echo "This script is intended to be run on Debian-based distros."
    exit 1
fi

# Check for missing packages
essential_packages=("git" "gcc" "curl")
essential_packages_str="${essential_packages[@]}"
installed_packages=$(dpkg-query -W -f='${Package}\n' $essential_packages_str 2>/dev/null)

for pkg in "${essential_packages[@]}"; do
    if ! grep -q "^$pkg$" <<< "$installed_packages"; then
        missing_packages+=("$pkg")
    fi
done

if [ ${#missing_packages[@]} -ne 0 ]; then
    echo "The following packages are missing: ${missing_packages[@]}"
    if [ $(id -u) -eq 0 ]; then
        read -p "Do you want to install them? (Y/n)" choice

        if [[ $choice =~ ^[Yy]$ ]] || [ -z "$choice" ]; then
            apt update
            apt install -y "${missing_packages[@]}"
        else
            echo "Install the packages by executing the following line by yourself."
            echo "apt update && apt install -y ${missing_packages[@]}"
            exit 1
        fi

    else
        echo "Install the packages by executing the following line by yourself."
        echo "sudo apt update && sudo apt install -y ${missing_packages[@]}"
        exit 1
    fi
fi

cleanup() {
    echo "Cleaning up..."
    rm -rf "$tmp_dir"
}

trap cleanup EXIT

# Clone the repository
tmp_dir=$(mktemp -d)
git clone https://github.com/123jimin/linux-bootstrap "$tmp_dir"

cd ~
for script in "$temp_dir"/*/main.sh; do
    bash "$script"
done