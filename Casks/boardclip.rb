# .github/workflows/update.yml keeps version and sha256 in step with the latest
# numbered release of https://github.com/tobq/boardclip (read from its SHA256SUMS.txt).

cask "boardclip" do
  version "2.1.116"
  sha256 "f5b95bc5ef3697c120628be3078b40ef092701e6ab05118f7449b56b3254bb40"

  url "https://github.com/tobq/boardclip/releases/download/v#{version}/BoardClip-macOS.dmg"
  name "BoardClip"
  desc "Clipboard history with search, groups, numpad quick paste and sync"
  homepage "https://boardclip.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "BoardClip.app"

  # BoardClip is signed but not notarised (no paid Apple Developer ID), so
  # Gatekeeper would block its first start while the download quarantine flag
  # is set. Remove the flag from the installed app only.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/BoardClip.app"],
        writable_paths: ["{{appdir}}/BoardClip.app"]
  end

  uninstall quit: "app.boardclip.desktop"

  zap trash: [
    "~/.boardclip",
    "~/Library/Application Support/BoardClip",
    "~/Library/Logs/BoardClip",
    "~/Library/Preferences/app.boardclip.desktop.plist",
    "~/Library/Saved Application State/app.boardclip.desktop.savedState",
  ]
end
