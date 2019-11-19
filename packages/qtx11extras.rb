require 'package'

class Qtx11extras < Package
  description 'Provides classes for developing for the X11 platform.'
  homepage 'https://www.qt.io/'
  version '5.13.2'
  source_url 'https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtx11extras-everywhere-src-5.13.2.tar.xz'
  source_sha256 '95a7c5c30f42e9575c3a17a2c0eb0cdbdd2d89dbcb3ee1426cd41bb07e28c51c'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'qtbase'

  def self.build
    system 'qmake && make'
  end

  def self.install
    FileUtils.mkdir_p "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r Dir.glob('lib/*'), "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.cp_r 'include', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'mkspecs', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'src', "#{CREW_DEST_PREFIX}/share/Qt-5"
  end
end
