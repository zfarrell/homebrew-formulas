class Liquibase < Formula
  desc "Library for database change tracking"
  homepage "http://liquibase.org"
  url "https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.4.1/liquibase-3.4.1-bin.tar.gz"
  sha256 "af495d408e1e5d0151d5b666862b731ae301452d"

  def install
    rm_f Dir["*.bat"]
    chmod 0755, "liquibase"
    prefix.install_metafiles
    libexec.install Dir["*"]
    bin.install_symlink libexec/"liquibase"
  end

  def caveats; <<-EOS.undent
    You should set the environment variable LIQUIBASE_HOME to
      #{libexec}
    EOS
  end

  test do
    system "#{bin}/liquibase", "--version"
  end
end
