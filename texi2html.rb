require 'formula'

class Texi2html < Formula
  homepage 'http://www.nongnu.org/texi2html/'
  url 'http://download-mirror.savannah.gnu.org/releases/texi2html/texi2html-1.82.tar.gz'
  sha256 '6c7c94a2d88ffe218a33e91118c2b039336cbe3f2f8b4e3a78e4fd1502072936'

  keg_only :provided_pre_mountain_lion

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
                          "--mandir=#{man}", "--infodir=#{info}"
    system "make install"
  end

  def test
    system "#{bin}/texi2html", "--help"
  end
end
