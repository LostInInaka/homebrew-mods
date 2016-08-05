require 'formula'

class Lcrack < Formula
  homepage 'https://launchpad.net/ubuntu/+archive/'
  url 'https://launchpad.net/ubuntu/+archive/primary/+files/lcrack_20040914.orig.tar.gz'
  sha256 'e2a3439ab7574f5d1dd345f34f8e244723c42770'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    bin.install "lcrack"
  end
end
