cask "marmot" do
  version "0.2.0"
  sha256 "3a9b52a62afe9e58644c059edf7901d48fac716f9fc8161a42e9db414b46c694"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Marmot.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.drdroid.marmot.plist",
    "~/.claude/marmot-inbox.jsonl",
    "~/.claude/marmot-app.json",
  ]
end
