class Shellbuddy < Formula
  desc "AI-native shell assistant powered by Ollama"
  homepage "https://github.com/iprevail-io/shellbuddy"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_UPDATE_AFTER_RELEASE"
    else
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_UPDATE_AFTER_RELEASE"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_UPDATE_AFTER_RELEASE"
    else
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_UPDATE_AFTER_RELEASE"
    end
  end

  def install
    bin.install "sb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sb --version")
  end

  def caveats
    <<~EOS
      ShellBuddy requires Ollama to be installed and running.
      Install Ollama: https://ollama.com

      Pull a model:
        ollama pull llama3.2

      Optional shell integration (add to shell config):
        Zsh:  eval "$(sb init zsh)"
        Bash: eval "$(sb init bash)"
        Fish: sb init fish | source
    EOS
  end
end
