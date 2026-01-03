case "$OSTYPE" in
  darwin*)
    # homebrew
    export PATH="/opt/homebrew/bin:$PATH"
    # Latex
    eval "$(/usr/libexec/path_helper)"
    # Gleam-dev
    export PATH="$HOME/dev/gleam/target/release:$PATH"
    # Chromium stuff for Puppeteer
    export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
    export PUPPETEER_EXECUTABLE_PATH=`which chromium`
    # coursier (Scala)
    export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
    export OPENAI_API_KEY=$(security find-generic-password -s 'OpenAI API key' -w)
    # Antigravity
    export PATH="/Users/damien/.antigravity/antigravity/bin:$PATH"
  ;;
  linux*)
    # GUIX
    export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
    # cargo
    . "$HOME/.cargo/env"
  ;;
esac

# direnv
eval "$(direnv hook zsh)"

# opam
eval $(opam env)
