FONT_REGULAR=https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
FONT_BOLD=https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
FONT_ITALIC=https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
FONT_BOLD_ITALIC=https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Donwloading fonts
(cd $HOME/.local/share/fonts && curl -LO $FONT_REGULAR)
(cd $HOME/.local/share/fonts && curl -LO $FONT_BOLD)
(cd $HOME/.local/share/fonts && curl -LO $FONT_ITALIC)
(cd $HOME/.local/share/fonts && curl -LO $FONT_BOLD_ITALIC)

# Reset font cache on Linux
if [[ -n $(command -v fc-cache) ]]; then
  fc-cache -f "$font_dir"
  case $? in
    [0-1])
      # Catch fc-cache returning 1 on a success
      exit 0
      ;;
    *)
      exit $?
      ;;
  esac
fi
