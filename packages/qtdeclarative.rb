require 'package'

class Qtdeclarative < Package
  description 'Provides QML and Quick declaratives.'
  homepage 'https://www.qt.io/'
  version '5.13.2'
  source_url 'https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtdeclarative-everywhere-src-5.13.2.tar.xz'
  source_sha256 'd9a524f45fe9e136cda2252f9d7013ec17046d907e3f39606db920987c22d1fd'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'python27'
  depends_on 'qtbase'

  def self.build
    system 'qmake && make'
  end

  def self.install
    FileUtils.mkdir_p "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r Dir.glob('lib/*'), "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.cp_r 'examples', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'include', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'mkspecs', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'tools', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'src', "#{CREW_DEST_PREFIX}/share/Qt-5"
  end
end
