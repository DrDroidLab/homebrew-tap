cask "marmot" do
  version "0.2.1"
  sha256 "b500d039356f17837d847e2b3788b4c6cd801ff503bfb7cb405737d3960a2384"

  url "https://github.com/DrDroidLab/marmot/releases/download/app-v#{version}/Marmot-#{version}.zip"
  name "Marmot"
  desc "Claude limits, cost and nudges in the menu bar"
  homepage "https://github.com/DrDroidLab/marmot"

  depends_on macos: :sonoma

  # Node ships inside the app, so nothing else needs installing.
  app "Marmot.app"
  binary "#{appdir}/Marmot.app/Contents/Resources/bin/marmot", target: "marmot"

  # Ad-hoc signed until there is a Developer ID: without this, Gatekeeper
  # refuses to open a downloaded app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Marmot.app"],
        must_succeed: false
  end

  zap trash: [
    "~/.claude/marmot-app.json",
    "~/.claude/marmot-inbox.jsonl",
    "~/Library/Preferences/io.drdroid.marmot.plist",
  ]
end
