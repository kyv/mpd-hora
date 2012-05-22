# Contributor: Kevin Brown <kev [at] flujos [dot] org>

pkgname=mpd-hora
pkgver=20120522
pkgrel=1
pkgdesc="mpd-hora"
arch=(i686 x86_64)
url="https://github.com/kyv/mpd-hora"
depends=('mpd' 'vorbis-tools') 
makedepends=('git')

_gitroot="git://github.com/kyv/mpd-hora.git"
_gitname="mpdhora"

md5sums=('eeb2c55443f753f9244eaac006cce132')
license=('perl5')

build()
{
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
	
       perl Makefile.Pl installdirs=vendor destdir="$pkgdir/"
       make || return 1
       make DESTDIR=$pkgdir install
       cd $pkgdir/usr/bin
}
