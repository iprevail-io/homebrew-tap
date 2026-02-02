class Shellbuddy < Formula
  desc "AI-native shell assistant powered by Ollama"
  homepage "https://github.com/iprevail-io/shellbuddy"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0de2cad5802a6d1f8a4c2b2f642edef564d162a9d0b634418d55874d82fe6695"
    else
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "48d13dd63d750c41e7c87c2889da772327721f9c7c94efc64d2d52ab26a78be1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4cca0d2f17c8308adc063ed3226c98f2590f1c3014c4db591bd77b4f15eecd0d"
    else
      url "https://github.com/iprevail-io/shellbuddy/releases/download/v#{version}/shellbuddy-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbeba943338fb563efddbd79a420a302d2b67909c99169675baa58269156f247"
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
