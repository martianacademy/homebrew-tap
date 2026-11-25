cask "olympus-coder" do
  version "0.3.10"
  sha256 "95df803a02ddc49d812786afd3413393c0eef72ddca3cb02323cf82a5046f5dc"

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
