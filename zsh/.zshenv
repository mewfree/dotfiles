case "$OSTYPE" in
  darwin*)
    # homebrew
    export PATH="/opt/homebrew/bin:$PATH"
    # asdf
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
    # Latex
    eval "$(/usr/libexec/path_helper)"
  ;;
  linux*)
    # asdf
    . /opt/asdf-vm/asdf.sh
  ;;
esac
