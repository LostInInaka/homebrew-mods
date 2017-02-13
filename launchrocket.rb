require 'formula'

class LaunchrocketPlists < Formula
  url 'https://github.com/jimbojsb/launchrocket/releases/download/v0.7/LaunchRocket.prefPane.zip'
  sha256 '51dc78902fecfb7ec26ab5c6516b84d1c62692349864ef48aca2fde81bd2ef4a'
  homepage 'http://github.com/jimbojsb/launchrocket-plists'
  version '0.1.4'
  skip_clean "plist/"
  
  def install
    ohai "Installing..."
    (etc/'launchrocket').mkpath rescue nil
    (etc/'launchrocket').install Dir["plist/*"]
  end
end
