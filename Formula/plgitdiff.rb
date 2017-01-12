class Plgitdiff < Formula
  desc "Shows git commit changes for plist files"
  homepage "https://github.com/scottrigby/plgitdiff"
  url "https://github.com/scottrigby/plgitdiff/archive/1.0.0.tar.gz"
  sha256 "b77c365111a5f98beabf2540de37bdf8e686ae01f38091cbade252d2adf4f6c5"

  def install
    system "sh", "install.sh", prefix
  end

  test do
    system "git init"
    system "touch file"
    system "git add file"
    system "echo foo >> file"
    o = shell_output("git diff")
    assert_match "+foo", o
  end
end
