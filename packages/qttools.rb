require 'package'

class Qttools < Package
  description 'Qt Tools'
  homepage 'https://github.com/qt/qttools'
  version '5.13.2'
  source_url 'https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qttools-everywhere-src-5.13.2.tar.xz'
  source_sha256 '919a2713b6d2d7873a09ad85bd93cf4282606e5bf84d5884250f665a253ec06e'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'qtbase'
  depends_on 'sommelier'

  def self.build
    system 'qmake && make'
  end

  def self.install
    FileUtils.mkdir_p "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/bin"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r Dir.glob('lib/*'), "#{CREW_DEST_LIB_PREFIX}"
    FileUtils.cp_r 'bin', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'examples', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'include', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'mkspecs', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'plugins', "#{CREW_DEST_PREFIX}/share/Qt-5"
    FileUtils.cp_r 'src', "#{CREW_DEST_PREFIX}/share/Qt-5"
    Dir.chdir "#{CREW_DEST_PREFIX}/share/Qt-5/bin" do
      system "find . -type f -exec ln -s #{CREW_PREFIX}/share/Qt-5/bin/{} #{CREW_DEST_PREFIX}/bin/{} \\;"
    end
  end
end
