class Pldiff < Formula
  desc "Compares plist files line by line"
  homepage "https://github.com/scottrigby/pldiff"
  url "https://github.com/scottrigby/pldiff/archive/1.0.4.tar.gz"
  sha256 "0093027aee4ceb049902a9fcea28923477c87c2f88813e2370fb4c12195b9ccd"

  depends_on "colordiff" => :recommended

  def install
    system "sh", "install.sh", prefix
  end

  test do
    system "defaults write #{testpath}/a foo -string bar"
    system "defaults write #{testpath}/b foo -string baz"
    o = shell_output("echo $(pldiff #{testpath}/a.plist #{testpath}/b.plist)")
    assert_match "- <string>bar</string>", o
    assert_match "+ <string>baz</string>", o
  end
end
