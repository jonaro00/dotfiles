####### Setup

if [ "$1" != "--zsh" ]; then
    sudo apt update
    sudo apt install -y zsh
    chsh -s $(which zsh)
    zsh .install-everything.sh --zsh
    exit 0
fi

[ "$SHELL" != "/usr/bin/zsh" ] && echo "Not in zsh" && exit 1

####### Shell

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####### General

sudo apt install -y cmake libssl-dev make pkg-config
sudo apt install -y cowsay curl gh htop jq nmap xxd

####### Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

cargo binstall -y --locked sccache
echo -e "[build]\nrustc-wrapper = \"$HOME/.cargo/bin/sccache\"" > ~/.cargo/config.toml

cargo binstall -y --locked bacon bandwhich bat bore-cli bottom cargo-edit cargo-expand cargo-modules cargo-shuttle cargo-watch difftastic diskus du-dust exa fd-find gping hexyl onefetch ripgrep rust-script starship trunk zellij
cargo install --locked cargo-info
