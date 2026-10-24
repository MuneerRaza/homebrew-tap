cask "kairos" do
  version "1.1.0"
  sha256 "3902458add677da7f1c190dfcbfd78af229af6bc07854dd386180e27c2bb53fe"

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
