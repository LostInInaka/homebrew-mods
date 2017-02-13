require 'formula'

class Catdoc < Formula
  homepage 'http://wagner.pp.ru/~vitus/software/catdoc/'
  url 'http://ftp.wagner.pp.ru/pub/catdoc/catdoc-0.95.tar.gz'
  sha256 '514a84180352b6bf367c1d2499819dfa82b60d8c45777432fa643a5ed7d80796'

  fails_with :clang do
    cause "The source uses undocumented behavior (decrementing null)."
  end

  patch :DATA
 
  def install
    # catdoc configure says it respects --mandir=, but does not.
    ENV['man1dir'] = man1
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # The INSTALL file confuses make on case insensitive filesystems.
    system "mv INSTALL INSTALL.txt"
    system "make"
    # There is a race condition in the charsets/Makefile install target. The following line solves it.
    system "make -C charsets install-dirs"
    system "make install"
  end
end
__END__
diff --git a/src/fileutil.c b/src/fileutil.c
index d902a6a..60667a4 100644
--- a/src/fileutil.c
+++ b/src/fileutil.c
@@ -77,7 +77,6 @@
        if (q) {
            if (!prepare_path_buf(path_buf,p,q)) continue;
        } else {
-           q--;
            if (!prepare_path_buf(path_buf,p,p+strlen(p))) continue;
        }
        strcat(path_buf,dir_sep); /* always one char */
@@ -87,6 +86,8 @@
        if (access(path_buf,0)==0) {
            free(name); 
            return strdup(path_buf);
+       } else if (!q) {
+           break;
        }
    }
    /* if we are here, nothing found */
