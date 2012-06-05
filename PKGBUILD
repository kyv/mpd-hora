#Contributor: Rasi <rasi@xssn.at>

pkgname=mpd-hora
arch=('any')
pkgver=20120524
pkgrel=1
pkgdesc="concatanate 2 vorbis files in order to say the time"
source=()
url="https://github.com/kyv/mpd-hora"
license="perl"
depends=('mpd' 'mpdcron-git')
makedepends=('make' 'wget' 'tar')
md5sums=()
options=('!libtool')
pwd=$(pwd)
#_gitroot="git://git.lizardhost.co.uk/mpdcron.git"
#_gitname="mpdcron"
_gitroot="git://github.com/kyv/mpd-hora"
_gitname="mpd-hora"

build() {
  cd ${srcdir}
  msg "Connecting to $pkgname GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
          cd $_gitname && git pull origin
          msg "The local files are updated."
  else
          git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  msg "configuring perl make..."
  perl Makefile.PL
  msg "Starting make..."
  make DESTDIR=$pkgdir install || return 1
  msg "copy mpdcron hook to /usr/share/doc/mpdcron/player.spxcat"
  mkdir -p $pkgdir/usr/share/doc/mpdcron/
  cp -af mpdcron/hooks/player $pkgdir/usr/share/doc/mpdcron/player.spxcat
  msg "download audios"
  wget http://yaxhil.flujos.org/wiki/audio.tar.xz
  mkdir -p $pkgdir/usr/share/spxcat/
  tar xvJf audio.tar.xz -C $pkgdir/usr/share/spxcat/
}
