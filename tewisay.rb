require 'formula'

class Tewisay < Formula
  homepage 'https://github.com/neeee/tewisay'
  url 'https://github.com/LostInInaka/tewisay.git'
  sha256 'da7e16048a1682a519d733047830beeefe340a19c9020fbb81ddd9db8d2644ee'
  version '0.1a'

  head 'https://github.com/neeee/tewisay.git'

  depends_on 'go'
  depends_on 'asciidoc'
  depends_on 'cowsay' => :optional

  def install
    system "go build tewisay.go"
    bin.install 'tewisay'
  end
end
