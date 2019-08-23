#!

# The package name of each item to install from the AUR
aur_list=(

  # IDEs
  code
  datagrip
  pycharm-professional
  webstorm
  intellij-idea-ultimate-edition
  clion

  # Languages
  jdk
  dart-sass
  goland

  # Software
  atom
  discord
  spotify
  spicetify-cli
  boostnote
  slack-desktop
  chromium-widevine
  gitkraken
  gllock-git
  deluge-stable-git
  docker-git

  # Games
  epsxe

  # Tools / Utilities
  gotop
  auryo
  ttf-ms-fonts
  neofetch
  ufetch-git
  yakuake-skin-arc-git

  # Minecraft, Bedrock Edition & Java
  mcpelauncher-linux-git
  mcpelauncher-msa-git
  mcpelauncher-msa-ui-qt-git
  mcpelauncher-ui-git
  minecraft-launcher
)

for var in "${aur_list[@]}"
do
  echo -S "${var}"
done

# Install Oh-My-Bash
sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
