require 'formula'

class Lcrack < Formula
  homepage 'https://launchpad.net/ubuntu/+archive/'
  url 'https://launchpad.net/ubuntu/+archive/primary/+files/lcrack_20040914.orig.tar.gz'
  sha1 'd3b8f217f8ace5f4545060d15ce9f85a0daba17f'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    bin.install "lcrack"
  end
end
