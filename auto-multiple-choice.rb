class AutoMultipleChoice < Formula
  desc "Printable tests for students with OCR marking"
  homepage "https://www.auto-multiple-choice.net"
  url "https://gitlab.com/jojo_boulix/auto-multiple-choice/uploads/ae5e224c2490bfcdec676a32b1b476f6/auto-multiple-choice_1.4.0_dist.tar.gz"
  version "1.4.0"
  sha256 "d3fba7346043f5dcd392ad24472dcb27f1ee785f1141555a8dbf6d5cd9e78490"
  revision 8
  # I had to remove the 'head' as we cannot compile using latex in Homebrew.
  # Instead, we use the 'distributed' tarballs from the Bitbucket's Downloads
  # which already contain the doc and doc/sty. See (1) for details.

  #  bottle do
  #    root_url "https://dl.bintray.com/maelvls/bottles-amc"
  #    cellar :any
  #    sha256 "4f9d9743f200d81b483d2cc47b9714e07dbf864d49b42162d5a852145be09bf6" => :catalina
  #    sha256 "4f9d9743f200d81b483d2cc47b9714e07dbf864d49b42162d5a852145be09bf6" => :mojave
  #    sha256 "40f71fa981dbf345db895fcdc1e347f761bc690beebc6976b1238e1a0a9ae656" => :high_sierra
  #  end

  # (1) I cannot set 'tex' as a default dependency as it is not handled by
  # the Homebrew core repository. On the contrary, x11 is well handled (it is
  # installed by default on their test-bot runs) and can be used as a default
  # dependency.
  # UPDATE January 17th, 2018: the Homebrew team has deprecated 'depends :tex'
  # completely, meaning that I cannot rely on it anymore in order to
  # have latex in the PATH. I replaced it with 'env :std' which asks brew not
  # to remove the original PATH of the user so that the latex binaries can be
  # found.

  depends_on "librsvg" => :build
  depends_on "make" => :build # macOS system make (3.81) breaks vars-subs.pl
  depends_on "adwaita-icon-theme"
  depends_on "amc-pango"
  depends_on "cairo"
  depends_on "freetype"
  depends_on "gettext"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "gtk+3"
  depends_on "imagemagick@6"
  depends_on "libffi"
  depends_on "libx11"
  depends_on "netpbm"
  depends_on "opencv" # vendored Pango, stuck at v1.42.4
  depends_on "perl"
  depends_on "poppler"
  depends_on "qpdf"

  # conflicts_with "auto-multiple-choice-devel", :because => "both install `bin/auto-multiple-choice`"

  # What is missing in this brew-flavoured AMC:
  # - shared-mime-info: there might be warnings about 'shared-mime-info'
  #   missing. Purpose? I don't know. It could be installed with
  #       brew install shared-mime-info
  #   but I just skipped it.
  # - libnotify: desktop notifications using libnotify + dbus cannot be used
  #   on MacOS, we should rather use a Growl or native notifications. So I
  #   removed the depends_on "libnotify" & "dbus" and the perl Desktop::Notify.
  #   Also, I disabled the feature (notify_desktop parameter in Config.pm).

  # Perl deps (generated by list_to_resources.pl):
  resource "Pango" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Pango-1.227.tar.gz"
    sha256 "34b0a422df3fecd7597587048552457d48ae764c43bbefd2a9d62ceb6c8bac71"
  end
  resource "ExtUtils::Depends" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/ExtUtils-Depends-0.405.tar.gz"
    sha256 "8ad6401ad7559b03ceda1fe4b191c95f417bdec7c542a984761a4656715a8a2c"
  end
  resource "Glib" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Glib-1.327.tar.gz"
    sha256 "1350d92975969387d27c9001a834037a0a2183789f4b0cd67e0af6021794f058"
  end
  resource "ExtUtils::PkgConfig" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/ExtUtils-PkgConfig-1.16.tar.gz"
    sha256 "bbeaced995d7d8d10cfc51a3a5a66da41ceb2bc04fedcab50e10e6300e801c6e"
  end
  resource "Cairo" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Cairo-1.106.tar.gz"
    sha256 "e64803018bc7cba49e73e258547f5378cc4249797beafec524852140f49c45c4"
  end
  resource "Archive::Zip" do
    url "https://cpan.metacpan.org/authors/id/P/PH/PHRED/Archive-Zip-1.63.tar.gz"
    sha256 "f12023b0e27c9504b7cf698426c726f4421707ef77c863ace98efc7692afe933"
  end
  resource "Test::MockModule" do
    url "https://cpan.metacpan.org/authors/id/G/GF/GFRANKS/Test-MockModule-v0.170.0.tar.gz"
    sha256 "9f79ba975cb049e1e807c36de1a31126079fffc4f22ee81526641a8969e6ef5d"
  end
  resource "Module::Build" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-0.4224.tar.gz"
    sha256 "a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782"
  end
  resource "SUPER" do
    url "https://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/SUPER-1.20141117.tar.gz"
    sha256 "1a620e7d60aee9b13b1b26a44694c43fdb2bba1755cfff435dae83c7d42cc0b2"
  end
  resource "Sub::Identify" do
    url "https://cpan.metacpan.org/authors/id/R/RG/RGARCIA/Sub-Identify-0.14.tar.gz"
    sha256 "068d272086514dd1e842b6a40b1bedbafee63900e5b08890ef6700039defad6f"
  end
  resource "Clone" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GARU/Clone-0.39.tar.gz"
    sha256 "acb046683e49d650b113634ecf57df000816a49e611b0fff70bf3f93568bfa2d"
  end
  resource "DBD::SQLite" do
    url "https://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/DBD-SQLite-1.58.tar.gz"
    sha256 "7120dd99d0338dea2802fda8bfe3fbf10077d5af559f6c67ae35e9270d1a1d3b"
  end
  resource "DBI" do
    url "https://cpan.metacpan.org/authors/id/T/TI/TIMB/DBI-1.641.tar.gz"
    sha256 "5509e532cdd0e3d91eda550578deaac29e2f008a12b64576e8c261bb92e8c2c1"
  end
  resource "Digest::MD5" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-MD5-2.55.tar.gz"
    sha256 "03b198a2d14425d951e5e50a885d3818c3162c8fe4c21e18d7798a9a179d0e3c"
  end
  resource "Email::MIME" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-MIME-1.946.tar.gz"
    sha256 "68ee79023165d77bec99a2e12ef89ad4e12501e6c321f6822053dc4f411c337c"
  end
  resource "Email::Simple::Creator" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Simple-2.216.tar.gz"
    sha256 "d85f63cd1088d11311103676a8cf498fff564a201b538de52cd753b5e5ca8bd4"
  end
  resource "Email::Date::Format" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Date-Format-1.005.tar.gz"
    sha256 "579c617e303b9d874411c7b61b46b59d36f815718625074ae6832e7bb9db5104"
  end
  resource "Module::Runtime" do
    url "https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Module-Runtime-0.016.tar.gz"
    sha256 "68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024"
  end
  resource "Email::MessageID" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-MessageID-1.406.tar.gz"
    sha256 "ec425ddbf395e0e1ac7c6f95b4933c55c57ac9f1e7514003c7c904ec6cd342b8"
  end
  resource "MIME::Types" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-2.17.tar.gz"
    sha256 "e04ed7d42f1ff3150a303805f2689c28f80b92c511784d4641cb7f040d3e8ff6"
  end
  resource "Email::Address::XS" do
    url "https://cpan.metacpan.org/authors/id/P/PA/PALI/Email-Address-XS-1.04.tar.gz"
    sha256 "995f6d04a7b487dd5e1b55e3b52cad84c87750937c96feb6e24e8f1f10cd593e"
  end
  resource "Email::MIME::Encodings" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-MIME-Encodings-1.315.tar.gz"
    sha256 "4c71045507b31ec853dd60152b40e33ba3741779c0f49bb143b50cf8d243ab5c"
  end
  resource "Capture::Tiny" do
    url "https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-0.48.tar.gz"
    sha256 "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
  end
  resource "Email::MIME::ContentType" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-MIME-ContentType-1.022.tar.gz"
    sha256 "9abb7280b0da62a855ae5528b14deb94341a84e721af0a7e5a2adc3534ec5310"
  end
  resource "Email::Sender" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Sender-1.300031.tar.gz"
    sha256 "c412372938510283d8c850127895e09c2b670f892e1c3992fd54c0c1a9064f14"
  end
  resource "Sub::Exporter" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Sub-Exporter-0.987.tar.gz"
    sha256 "543cb2e803ab913d44272c7da6a70bb62c19e467f3b12aaac4c9523259b083d6"
  end
  resource "Params::Util" do
    url "https://cpan.metacpan.org/authors/id/A/AD/ADAMK/Params-Util-1.07.tar.gz"
    sha256 "30f1ec3f2cf9ff66ae96f973333f23c5f558915bb6266881eac7423f52d7c76c"
  end
  resource "Data::OptList" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Data-OptList-0.110.tar.gz"
    sha256 "366117cb2966473f2559f2f4575ff6ae69e84c69a0f30a0773e1b51a457ef5c3"
  end
  resource "Sub::Install" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Sub-Install-0.928.tar.gz"
    sha256 "61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f"
  end
  resource "MooX::Types::MooseLike::Base" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MATEU/MooX-Types-MooseLike-0.29.tar.gz"
    sha256 "1d3780aa9bea430afbe65aa8c76e718f1045ce788aadda4116f59d3b7a7ad2b4"
  end
  resource "Test::Fatal" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.014.tar.gz"
    sha256 "bcdcef5c7b2790a187ebca810b0a08221a63256062cfab3c3b98685d91d1cbb0"
  end
  resource "Try::Tiny" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Try-Tiny-0.30.tar.gz"
    sha256 "da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b"
  end
  resource "Moo" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Moo-2.003004.tar.gz"
    sha256 "f8bbb625f8e963eabe05cff9048fdd72bdd26777404ff2c40bc690f558be91e1"
  end
  resource "Role::Tiny" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Role-Tiny-2.000006.tar.gz"
    sha256 "cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382"
  end
  resource "Sub::Defer" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Sub-Quote-2.005001.tar.gz"
    sha256 "d6ab4f0775def015367a05e02024b403f991b2be11d774f3d235fe7e9bdbba07"
  end
  resource "Class::Method::Modifiers" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Class-Method-Modifiers-2.12.tar.gz"
    sha256 "e44c1073020bf55b8c97975ed77235fd7e2a6a56f29b5c702301721184e27ac8"
  end
  resource "Test::Requires" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/Test-Requires-0.10.tar.gz"
    sha256 "2768a391d50ab94b95cefe540b9232d7046c13ee86d01859e04c044903222eb5"
  end
  resource "Devel::GlobalDestruction" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Devel-GlobalDestruction-0.14.tar.gz"
    sha256 "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab"
  end
  resource "Sub::Exporter::Progressive" do
    url "https://cpan.metacpan.org/authors/id/F/FR/FREW/Sub-Exporter-Progressive-0.001013.tar.gz"
    sha256 "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
  end
  resource "Email::Abstract" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Abstract-3.008.tar.gz"
    sha256 "fc7169acb6c43df7f005e7ef6ad08ee8ca6eb6796b5d1604593c997337cc8240"
  end
  resource "Email::Simple" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Simple-2.216.tar.gz"
    sha256 "d85f63cd1088d11311103676a8cf498fff564a201b538de52cd753b5e5ca8bd4"
  end
  resource "MRO::Compat" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/MRO-Compat-0.13.tar.gz"
    sha256 "8a2c3b6ccc19328d5579d02a7d91285e2afd85d801f49d423a8eb16f323da4f8"
  end
  resource "Module::Pluggable" do
    url "https://cpan.metacpan.org/authors/id/S/SI/SIMONW/Module-Pluggable-5.2.tar.gz"
    sha256 "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
  end
  resource "Throwable::Error" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Throwable-0.200013.tar.gz"
    sha256 "9987d0deb5bddd352a6330cefbe932f882e36dd8c8a4564bcfd372dc396b8fa0"
  end
  resource "Devel::StackTrace" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Devel-StackTrace-2.03.tar.gz"
    sha256 "7618cd4ebe24e254c17085f4b418784ab503cb4cb3baf8f48a7be894e59ba848"
  end
  resource "Email::Address" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Address-1.909.tar.gz"
    sha256 "6f2c532751718eb5e300d295fb18695d9525747d3bb9f2dd732e4903a836fd50"
  end
  resource "File::BaseDir" do
    url "https://cpan.metacpan.org/authors/id/K/KI/KIMRYAN/File-BaseDir-0.08.tar.gz"
    sha256 "c065fcd3e2f22ae769937bcc971b91f80294d5009fac140bfba83bf7d35305e3"
  end
  resource "File::MimeInfo" do
    url "https://cpan.metacpan.org/authors/id/M/MI/MICHIELB/File-MimeInfo-0.29.tar.gz"
    sha256 "f1962779652eae1d5a6e722a5220e3c50465deac52bb8dea47e0fbcfb6c908ea"
  end
  resource "IPC::System::Simple" do
    url "https://cpan.metacpan.org/authors/id/P/PJ/PJF/IPC-System-Simple-1.25.tar.gz"
    sha256 "f1b6aa1dfab886e8e4ea825f46a1cbb26038ef3e727fef5d84444aa8035a4d3b"
  end
  resource "File::Which" do
    url "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Which-1.22.tar.gz"
    sha256 "e8a8ffcf96868c6879e82645db4ff9ef00c2d8a286fed21971e7280f52cf0dd4"
  end
  resource "File::DesktopEntry" do
    url "https://cpan.metacpan.org/authors/id/M/MI/MICHIELB/File-DesktopEntry-0.22.tar.gz"
    sha256 "169c01e3dae2f629767bec1a9f1cdbd6ec6d713d1501e0b2786e4dd1235635b8"
  end
  resource "URI::Escape" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-1.74.tar.gz"
    sha256 "a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d"
  end
  resource "Test::Needs" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Test-Needs-0.002005.tar.gz"
    sha256 "5a4f33983586edacdbe00a3b429a9834190140190dab28d0f873c394eb7df399"
  end
  resource "Glib::Object::Introspection" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Glib-Object-Introspection-0.045.tar.gz"
    sha256 "5f0b88d5cf9b9d5d60c90ea9d411076bea54a2c0757c8f4d527520e5f332e7bb"
  end
  resource "Gtk3" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Gtk3-0.034.tar.gz"
    sha256 "0adb213b72604310cd4190c78969b4e46f94638c364040d4dceab8f629f45d2d"
  end
  resource "Cairo::GObject" do
    url "https://cpan.metacpan.org/authors/id/X/XA/XAOC/Cairo-GObject-1.004.tar.gz"
    sha256 "3bb9d40e802e51f56f1364abc553758152131803c12d85ba6e14bad6813409d5"
  end
  resource "Locale::gettext" do
    url "https://cpan.metacpan.org/authors/id/P/PV/PVANDRY/gettext-1.07.tar.gz"
    sha256 "909d47954697e7c04218f972915b787bd1244d75e3bd01620bc167d5bbc49c15"
  end
  resource "Module::Load::Conditional" do
    url "https://cpan.metacpan.org/authors/id/B/BI/BINGOS/Module-Load-Conditional-0.68.tar.gz"
    sha256 "7627b55cd94a2f1a4667f9203e2c990cad015bf34ec6b41b4f73af848f0698fd"
  end
  resource "OpenOffice::OODoc" do
    url "https://cpan.metacpan.org/authors/id/J/JM/JMGDOC/OpenOffice-OODoc-2.125.tar.gz"
    sha256 "c11448970693c42a8b9e93da48cac913516ce33a9d44a6468400f7ad8791dab6"
  end
  resource "XML::Twig" do
    url "https://cpan.metacpan.org/authors/id/M/MI/MIROD/XML-Twig-3.52.tar.gz"
    sha256 "fef75826c24f2b877d0a0d2645212fc4fb9756ed4d2711614ac15c497e8680ad"
  end
  resource "XML::Parser" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.44.tar.gz"
    sha256 "1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216"
  end
  resource "LWP::UserAgent" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/libwww-perl-6.35.tar.gz"
    sha256 "dda2578d7b32152c4afce834761a61d117de286c705a9f7972c7ac6032ca5953"
  end
  resource "Test::RequiresInternet" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MALLEN/Test-RequiresInternet-0.05.tar.gz"
    sha256 "bba7b32a1cc0d58ce2ec20b200a7347c69631641e8cae8ff4567ad24ef1e833e"
  end
  resource "Image::Magick" do
    url "https://cpan.metacpan.org/authors/id/J/JC/JCRISTY/PerlMagick-6.89-1.tar.gz"
    sha256 "c8f81869a4f007be63e67fddf724b23256f6209f16aa95e14d0eaef283772a59"
  end
  resource "Text::CSV" do
    url "https://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/Text-CSV-1.97.tar.gz"
    sha256 "cc350462efa8d39d5c8a1da5f205bc31620cd52d9865a769c8e3ed1b41640fd5"
  end
  resource "XML::Simple" do
    url "https://cpan.metacpan.org/authors/id/G/GR/GRANTM/XML-Simple-2.25.tar.gz"
    sha256 "531fddaebea2416743eb5c4fdfab028f502123d9a220405a4100e68fc480dbf8"
  end
  resource "XML::SAX" do
    url "https://cpan.metacpan.org/authors/id/G/GR/GRANTM/XML-SAX-1.00.tar.gz"
    sha256 "45ea6564ef8692155d57b2de0862b6442d3c7e29f4a9bc9ede5d7ecdc74c2ae3"
  end
  resource "XML::NamespaceSupport" do
    url "https://cpan.metacpan.org/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-1.12.tar.gz"
    sha256 "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
  end
  resource "XML::SAX::Base" do
    url "https://cpan.metacpan.org/authors/id/G/GR/GRANTM/XML-SAX-Base-1.09.tar.gz"
    sha256 "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0"
  end
  resource "XML::SAX::Expat" do
    url "https://cpan.metacpan.org/authors/id/B/BJ/BJOERN/XML-SAX-Expat-0.51.tar.gz"
    sha256 "4c016213d0ce7db2c494e30086b59917b302db8c292dcd21f39deebd9780c83f"
  end
  resource "HTTP::Status" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Message-6.18.tar.gz"
    sha256 "d060d170d388b694c58c14f4d13ed908a2807f0e581146cef45726641d809112"
  end
  resource "LWP::MediaTypes" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/LWP-MediaTypes-6.02.tar.gz"
    sha256 "18790b0cc5f0a51468495c3847b16738f785a2d460403595001e0b932e5db676"
  end
  resource "Encode::Locale" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz"
    sha256 "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
  end
  resource "IO::HTML" do
    url "https://cpan.metacpan.org/authors/id/C/CJ/CJM/IO-HTML-1.001.tar.gz"
    sha256 "ea78d2d743794adc028bc9589538eb867174b4e165d7d8b5f63486e6b828e7e0"
  end
  resource "URI" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-1.74.tar.gz"
    sha256 "a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d"
  end
  resource "HTTP::Date" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Date-6.02.tar.gz"
    sha256 "e8b9941da0f9f0c9c01068401a5e81341f0e3707d1c754f8e11f42a7e629e333"
  end
  resource "File::Listing" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/File-Listing-6.04.tar.gz"
    sha256 "1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5"
  end
  resource "HTTP::Daemon" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Daemon-6.01.tar.gz"
    sha256 "43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2"
  end
  resource "HTML::Tagset" do
    url "https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/HTML-Tagset-3.20.tar.gz"
    sha256 "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
  end
  resource "HTTP::Cookies" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Cookies-6.04.tar.gz"
    sha256 "0cc7f079079dcad8293fea36875ef58dd1bfd75ce1a6c244cd73ed9523eb13d4"
  end
  resource "WWW::RobotRules" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/WWW-RobotRules-6.02.tar.gz"
    sha256 "46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e"
  end
  resource "HTTP::Negotiate" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-6.01.tar.gz"
    sha256 "1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016"
  end
  resource "Net::HTTP" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Net-HTTP-6.18.tar.gz"
    sha256 "7e42df2db7adce3e0eb4f78b88c450f453f5380f120fd5411232e03374ba951c"
  end
  resource "XML::Writer" do
    url "https://cpan.metacpan.org/authors/id/J/JO/JOSEPHW/XML-Writer-0.625.tar.gz"
    sha256 "e080522c6ce050397af482665f3965a93c5d16f5e81d93f6e2fe98084ed15fbe"
  end
  resource "Locale::Language" do
    url "https://cpan.metacpan.org/authors/id/S/SB/SBECK/Locale-Codes-3.58.tar.gz"
    sha256 "345c0b0170288d74a147fbe218b7c78147aa2baf4e839fe8680a2b0a2d8e505b"
  end
  resource "Locale::Codes" do
    url "https://cpan.metacpan.org/authors/id/S/SB/SBECK/Locale-Codes-3.58.tar.gz"
    sha256 "345c0b0170288d74a147fbe218b7c78147aa2baf4e839fe8680a2b0a2d8e505b"
  end
  resource "IO::Socket::SSL" do
    url "https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-2.071.tar.gz"
    sha256 "40da40948ecc9c787ed39c95715872679eebfd54243721174993a2003e32ab0a"
  end
  resource "Net::SSLeay" do
    url "https://cpan.metacpan.org/authors/id/C/CH/CHRISN/Net-SSLeay-1.90.tar.gz"
    sha256 "f8696cfaca98234679efeedc288a9398fcf77176f1f515dbc589ada7c650dc93"
  end
  resource "Mozilla::CA" do
    url "https://cpan.metacpan.org/authors/id/A/AB/ABH/Mozilla-CA-20200520.tar.gz"
    sha256 "b3ca0002310bf24a16c0d5920bdea97a2f46e77e7be3e7377e850d033387c726"
  end
  resource "Authen::SASL" do
    url "https://cpan.metacpan.org/authors/id/G/GB/GBARR/Authen-SASL-2.16.tar.gz"
    sha256 "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09"
  end
  resource "Digest::HMAC_MD5" do
    url "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-1.04.tar.gz"
    sha256 "d6bc8156aa275c44d794b7c18f44cdac4a58140245c959e6b19b2c3838b08ed4"
  end

  def install
    installed = {} # helps me avoid installing the same perl package twice

    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PATH", Formula["gettext"].bin # for msgfmt during build
    ENV.prepend_path "PATH", Formula["make"].libexec/"gnubin" # system's make (3.81) too old
    ENV.prepend_path "PKG_CONFIG_PATH", "#{Formula["libffi"].lib}/pkgconfig" # for Glib::Object::Introspection
    ENV.prepend_path "PKG_CONFIG_PATH", "#{Formula["amc-pango"].lib}/pkgconfig" # for Pango & AMC-buildpdf

    ENV["PERL_MM_OPT"] = "INSTALL_BASE=#{libexec}" # for cpan (Makefile.PL)
    ENV["PERL_MB_OPT"] = "--install_base '#{libexec}'" # for cpan (Build.PL)
    ENV["PERL_MM_USE_DEFAULT"] = "1" # for always saying "yes" in Makefile.PL

    # The Libertine font provided by 'brew cask' is 'Linux Libertine' (no O)
    inreplace ["AMC-annotate.pl", "AMC-perl/AMC/Annotate.pm", "AMC-perl/AMC/Config.pm",
               "AMC-perl/AMC/Filter/plain.pm", "buildpdf.cc"], "Linux Libertine O", "Linux Libertine"

    # When using 'sudo auto-multiple-choice latex-link', make sure that the
    # symlink used in 'latex-link' is not version-hardcoded so that
    # 'brew upgrade' won't require a 'latex-link' afterwards.
    # Why? Because @/TEXDIR/@ is using #{prefix} which changes on each version.
    inreplace "AMC-latex-link.pl.in", "@/TEXDIR/@", opt_share/"texmf-local/tex/latex/AMC"

    # These are needed because Homebrew moved to opencv4 on Dec. 28, 2018 and it
    # broke things. Now c++11 is needed and I use pkg-config for conveniency.
    # And since pkg-config is used, CFLAGS, CXXFLAGS and LDFLAGS aren't needed
    # anymore.
    inreplace "Makefile", "opencv\)", "opencv4)"
    inreplace "Makefile", "$(GCC_OPENCV) $(GCC_OPENCV_LIBS)", "$(GCC_OPENCV) $(GCC_OPENCV_LIBS) -std=c++11"
    inreplace "Makefile-brew.conf", /^GCC_.*/, ""
    inreplace "Makefile-brew.conf", /^CFLAGS.*/, ""
    inreplace "Makefile-brew.conf", /^CXXFLAGS.*/, ""
    inreplace "Makefile-brew.conf", /^LDFLAGS.*/, ""

    # Override three variables that cannot be passed as make variables
    # because they are reset in Makefile.conf.
    (buildpath/"Makefile-brew.conf").append_lines <<~EOS
      DOCBOOK_MAN_XSL = #{Formula["docbook-xsl"].prefix}/docbook-xsl/manpages/docbook.xsl
      DOCBOOK_XHTML_XSL = #{Formula["docbook-xsl"].prefix}/docbook-xsl/xhtml/docbook.xsl
      DOCBOOK_DTD = #{Formula["docbook"].prefix}/docbook/xml/4.5/docbookx.dtd
      PERLPATH=#{Formula["perl"].bin}/perl
      PERLDIR=#{libexec}/lib/perl5
    EOS

    # The actual build
    make_opts = "AMCCONF=brew", "PREFIX=#{prefix}", "LIBS_PREFIX=#{HOMEBREW_PREFIX}"
    system "make", *make_opts
    system "make", "install_doc", *make_opts
    system "make", "install_nodoc", *make_opts

    mkdir_p libexec/"bin"
    mv bin/"auto-multiple-choice", libexec/"bin/auto-multiple-choice"
    (bin/"auto-multiple-choice").write_env_script libexec/"bin/auto-multiple-choice",
        PERL5LIB:   ENV["PERL5LIB"],
        # netpbm, poppler and imagemagick@6 must be in the PATH
        PATH:       "#{libexec}/bin:#{Formula["qpdf"].bin}:#{Formula["netpbm"].bin}"\
                    ":#{Formula["poppler"].bin}:#{Formula["imagemagick@6"].bin}:$PATH",
        AMCBASEDIR: prefix

    # Here are all the perl dependencies that we will vendor (= install locally
    # only for this recipe):
    # - Archive::Zip
    # - Clone
    # - DBD::SQLite
    # - Digest::MD5
    # - Email::MIME
    # - Email::Sender
    # - File::BaseDir
    # - File::MimeInfo
    # - Glib::Object::Introspection
    # - Gtk3
    # - Locale::Gettext
    # - Module::Load::Conditional
    # - OpenOffice::OODoc
    # - Image::Magick
    # - Text::CSV
    # - XML::Simple
    # - XML::Writer

    # 1) To create the following array with a hierarchy-like indentation,
    #    I went to http://deps.cpantesters.org for each package and copied
    #    the resulting table with the dependency hierarchy and used:
    # cat deps_archive_zip | sed 's/-\t//g' | sed '/^.*Core module.*$/d' | \
    #     sed 's/^\(.*\)  Bugreports.*$/\1/g' | sed 's/[ \t]*$//g' | \
    #     sed 's/^\( *\)\([^ ]*\)$/\1"\2",/g' | sed 's/ "/"/g' | sed 's/    /  /g'

    # 2) From this array, I create the 'resource ... do ... end' using:
    #    ./list_to_resources.pl < ruby_list > resources
    #    The code of "list_to_resources.pl" is showed at the end of this file.

    # Note that duplicates are allowed; only the first package from the
    # bottom will be installed.
    "
      Pango
        ExtUtils::Depends
        Glib
          ExtUtils::PkgConfig
        Cairo
      Archive::Zip
        Test::MockModule
          Module::Build
          SUPER
            Sub::Identify
      Clone
      DBD::SQLite
        DBI
      Digest::MD5
      Email::MIME
        Email::Simple::Creator
          Email::Date::Format
        Module::Runtime
          Module::Build
        Email::MessageID
        MIME::Types
        Email::Address::XS
        Email::MIME::Encodings
          Capture::Tiny
        Email::MIME::ContentType
      Email::Sender
        Capture::Tiny
        Sub::Exporter
          Params::Util
          Data::OptList
            Sub::Install
        MooX::Types::MooseLike::Base
          Test::Fatal
            Try::Tiny
          Module::Runtime
            Module::Build
          Moo
            Role::Tiny
            Sub::Defer
            Class::Method::Modifiers
              Test::Requires
            Devel::GlobalDestruction
              Sub::Exporter::Progressive
        Email::Abstract
          Email::Simple
            Email::Date::Format
          MRO::Compat
          Module::Pluggable
        Throwable::Error
          Devel::StackTrace
        Email::Address
      File::BaseDir
      File::MimeInfo
        File::BaseDir
          IPC::System::Simple
          File::Which
          Module::Build
        File::DesktopEntry
          URI::Escape
            Test::Needs
      Glib::Object::Introspection
      Gtk3
        Glib::Object::Introspection
        Cairo::GObject
          Cairo
          Glib
            ExtUtils::PkgConfig
          ExtUtils::Depends
      Locale::gettext
      Module::Load::Conditional
      OpenOffice::OODoc
        Archive::Zip
          Test::MockModule
            Module::Build
            SUPER
              Sub::Identify
        XML::Twig
          XML::Parser
            LWP::UserAgent
              Test::RequiresInternet
      Image::Magick
      Text::CSV
      XML::Simple
        XML::SAX
          XML::NamespaceSupport
          XML::SAX::Base
        XML::SAX::Expat
          XML::SAX
            XML::NamespaceSupport
            XML::SAX::Base
          XML::Parser
            LWP::UserAgent
              Test::RequiresInternet
              HTTP::Status
              LWP::MediaTypes
                Encode::Locale
                IO::HTML
                URI
                Test::Needs
              HTTP::Date
              File::Listing
                HTTP::Daemon
                HTML::Tagset
              HTTP::Cookies
              WWW::RobotRules
              HTTP::Negotiate
              Net::HTTP
      XML::Writer
      Locale::Language
      IO::Socket::SSL
        Net::SSLeay
        Mozilla::CA
      Authen::SASL
        Digest::HMAC_MD5
    ".each_line.reverse_each.map(&:strip).reject(&:empty?).each do |package|
      install_perl_package(package, installed)
    end
  end

  # WARNING: when installing Cairo from CPAN, make test won't pass because of
  # a (likely) bug in the count of tests skipped (Test::More); there is a
  # 'Bad plan' error.
  #
  # WARNING: with perl v5.26.1 and Pango-1.227, 'perl Makefile.PL' segfaults.
  # In the following list, the dependency tree is given by identations.
  # Also, this list is installed from the bottom to the top.
  def install_perl_package(package, installed)
    if installed[package].nil?
      installed[package] = true
      resource(package).stage do
        if ["XML::SAX", "XML::SAX::Expat"].include? package
          # XML::SAX and XML::SAX::Expat have a race condition during
          # 'make install'.  Workaround proposed: unset the MAKEFLAGS variable
          # before installing.
          # See: https://github.com/miyagawa/cpanminus/issues/31
          system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLMAN1DIR=none", "INSTALLMAN3DIR=none"
          system "make"
          ENV.deparallelize do # it basically unsets MAKEFLAGS
            system "make", "install"
          end
        elsif package == "Locale::gettext"
          # I read this: https://gist.github.com/andyjack/a2d8684c13d81adbba6ca550a8d9f54b
          ENV["CC"] = "#{ENV["CC"]} -I#{Formula["gettext"].include} -L#{Formula["gettext"].lib}"
          system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLMAN1DIR=none", "INSTALLMAN3DIR=none"
          inreplace "Makefile", /CCCDLFLAGS *=/, "CCCDLFLAGS = -I#{Formula["gettext"].include}"
          inreplace "Makefile", /LDDLFLAGS *=/, "LDDLFLAGS = -L#{Formula["gettext"].lib}"
          system "make"
          system "make", "install"
        elsif package == "Image::Magick"
          system "perl", "Makefile.PL",
            "INSTALL_BASE=#{libexec}",
            "INSTALLMAN1DIR=none", "INSTALLMAN3DIR=none",
            "INC=-I#{Formula["imagemagick@6"].include}/ImageMagick-6",
            "LIBS=-L#{Formula["imagemagick@6"].lib}"
          inreplace "Makefile", /CCCDLFLAGS *=/, "CCCDLFLAGS = -I#{Formula["imagemagick@6"].include}/ImageMagick-6"
          inreplace "Makefile", /LDDLFLAGS *=/, "LDDLFLAGS = -L#{Formula["gettext"].lib}"
          system "make"
          system "make", "install"
        elsif package == "Pango"
          system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLMAN1DIR=none", "INSTALLMAN3DIR=none"

          # With the M1 chip, macOS seems to not have /usr/local/lib anymore.
          # Fixes https://github.com/maelvls/homebrew-amc/issues/55.
          inreplace "Makefile", "-L/usr/local/lib", "" if Hardware::CPU.intel?

          system "make"
          system "make", "install"
        elsif File.exist? "Makefile.PL"
          system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLMAN1DIR=none", "INSTALLMAN3DIR=none"
          system "make"
          system "make", "install"
        elsif File.exist? "Build.PL"
          system "perl", "Build.PL", "--install_base", libexec
          system "./Build"
          system "./Build", "install"
        else
          raise "Unknown build system for #{r.name}"
        end
      end
    end
  end

  def caveats
    <<~EOS
      If you don't have Mactex installed, you will need it:

             brew cask install mactex

      Where is automultiplechoice.sty? After installing, run:

             sudo auto-multiple-choice latex-link remove
             sudo auto-multiple-choice latex-link

      If you have any problem/remark regarding this formula, you can submit
      an issue to https://github.com/maelvls/homebrew-amc.
    EOS
  end

  test do
    Open3.popen3("#{bin}/auto-multiple-choice detect") do |stdin, stdout, _|
      stdin.write "\r\n\r\n"
      assert_match stdout.gets("\r\n\r\n"), "TX=0.00 TY=0.00 DIAM=0.00\n"
    end

    # We cannot test the GUI but we still want to check if there is no error
    # such as "Cairo.c: loadable library and perl binaries are mismatched".
    # Open3.popen3("#{bin}/auto-multiple-choice --do-nothing") do |_, _, _, wait_thr|
    #   assert_equal 0, wait_thr.value
    # end
  end
end
