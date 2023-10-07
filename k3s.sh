  #!/bin/bash
  sudo apt install openssh-client
  sudo apt install openssh-server
  sudo ufw allow from {{you_public_IP}} to any port 22
  sudo ufw allow from notreallystatic.duckdns.org to any port 22
  sudo ufw --force enable
  #curl and run k3s
  curl -sfL https://get.k3s.io | sh -
  #installing cilium cli
  cilium version --client
  #cloning cilium git
  CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
  CLI_ARCH=amd64
  if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
  curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
  sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
  sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
  rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
  #installing cilium
  cilium install --version 1.14.1