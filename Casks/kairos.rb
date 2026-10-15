cask "kairos" do
  version "1.0.0"
  sha256 "8a56c42a07dfd4b78c4d85e5d6364411b6ffbb21f4db12501388739caa251c4d"

  url "https://github.com/MuneerRaza/kairos/releases/download/v#{version}/Kairos-#{version}.zip"
  name "Kairos"
  desc "Native clipboard manager with Liquid Glass"
  homepage "https://github.com/MuneerRaza/kairos"

  depends_on macos: ">= :tahoe"

  app "Kairos.app"

  # Kairos is ad-hoc signed and not notarized, so clear the download quarantine.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kairos.app"]
  end

  uninstall quit: "com.muneerraza.kairos"

  zap trash: [
    "~/Library/Application Support/Kairos",
    "~/Library/Preferences/com.muneerraza.kairos.plist",
  ]
end
