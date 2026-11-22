cask "olympus-coder" do
  version "0.3.2"
  sha256 "3428a8af0d3bb2ebe835cfa5354f2e324ba41ad4d70f9cd5a3208b0683338d96"

  url "https://github.com/martianacademy/olympus-coder/releases/download/v#{version}/Olympus.Coder-#{version}-arm64.dmg"
  name "Olympus Coder"
  desc "Open-source desktop workbench for Claude Code, Codex, Antigravity, and 18+ ACP coding agents"
  homepage "https://github.com/martianacademy/olympus-coder"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Olympus Coder.app"

  zap trash: [
    "~/Library/Application Support/Olympus Coder",
    "~/Library/Preferences/com.olympuscoder.app.plist",
    "~/Library/Saved Application State/com.olympuscoder.app.savedState",
  ]

  caveats <<~EOS
    Olympus Coder is currently ad-hoc signed. If macOS Gatekeeper warns on first launch, run:
      xattr -dr com.apple.quarantine "/Applications/Olympus Coder.app"
  EOS
end
