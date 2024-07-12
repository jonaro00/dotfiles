####### Setup

if [ "$1" != "--zsh" ]; then
    sudo apt update
    sudo apt install -y zsh
    chsh -s $(which zsh)
    zsh scripts/scripts/install-everything.sh --zsh
    exit 0
fi

####### Shell

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####### General

sudo apt install -y cmake libssl-dev make pkg-config
sudo ln -s /usr/lib/libssl.so /usr/lib/libssl.so.1.1
sudo apt install -y cowsay curl direnv gh htop jq nmap xxd

####### Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
source "$HOME/.cargo/env"

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

cargo install --locked sccache
echo -e "[build]\nrustc-wrapper = \"$HOME/.cargo/bin/sccache\"" > ~/.cargo/config.toml

cargo binstall -y --locked atuin bacon bandwhich bat bore-cli bottom cargo-edit cargo-expand cargo-make cargo-modules cargo-shuttle cargo-watch difftastic diskus du-dust eza fd-find git-cliff gping hexyl onefetch ripgrep rust-script starship trunk zellij zoxide
cargo install --locked cargo-info

####### Cleanup

echo moving old zsh config
mv ~/.zshrc ~/.zshrc.bak
