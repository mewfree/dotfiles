case "$OSTYPE" in
  darwin*)
    # homebrew
    export PATH="/opt/homebrew/bin:$PATH"
    # Latex
    eval "$(/usr/libexec/path_helper)"
    # Gleam-dev
    export PATH="$HOME/dev/gleam/target/release:$PATH"
  ;;
esac

# direnv
eval "$(direnv hook zsh)"

# opam
eval $(opam env)
