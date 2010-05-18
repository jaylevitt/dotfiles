# echo "Running .zshenv from macpro"
# Note: enabling the above echo will break scp from other hosts! Weird.

export LIBPREFIX="/opt/local"
#  automake seach path
export CPATH="$LIBPREFIX/include"
#  configure search path
export CPPFLAGS="-I$CPATH"
export LDFLAGS="-L$LIBPREFIX/lib"
# cmake search path
export CMAKE_INCLUDE_PATH=$CPATH
export CMAKE_LIBRARY_PATH="$LIBPREFIX/lib"

#  compiler arguments
export CXXFLAGS="$CFLAGS"
export LIBTOOLIZE="/opt/local/bin/glibtoolize"

# PostgreSQL building
export ARCHFLAGS="-arch i386"
