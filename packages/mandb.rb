require 'package'

class Mandb < Package
  version '2.7.6'
  source_url 'https://download.savannah.gnu.org/releases/man-db/man-db-2.7.6.tar.xz'
  source_sha1 '35a10f80d5cf6411d5c73376fcddcec1539e788a'
  
  def self.build
    system './configure',
      '--with-systemdtmpfilesdir=/usr/local/lib/tmpfiles.d',  # we can't write to /usr/lib/tmpfiles.d
      '--disable-cache-owner',                                # we can't create the user 'man'
      '--with-pager=/usr/local/bin/less'                      # the pager is not at the default location
    system 'make'
  end
  
  def self.install
    system 'make', 'install'
  end

  depends_on 'libpipeline'
  depends_on 'pkgconfig'
  depends_on 'gdbm'
  depends_on 'groff'
  depends_on 'less'

end
