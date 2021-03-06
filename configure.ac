define(_CLIENT_VERSION_MAJOR,0)
define(_CLIENT_VERSION_MINOR,1)
define(_CLIENT_VERSION_REVISION,0)
define(_CLIENT_VERSION_BUILD,0)
define(_CLIENT_VERSION_RC,0)

AC_INIT([resume],m4_join([.], _CLIENT_VERSION_MAJOR, _CLIENT_VERSION_MINOR, _CLIENT_VERSION_REVISION, m4_if(_CLIENT_VERSION_BUILD, [0], [], _CLIENT_VERSION_BUILD))m4_if(_CLIENT_VERSION_RC, [0], [], [rc]_CLIENT_VERSION_RC),[https://github.com/hawkmauk/resume/issues],[runcrypto],[https://runcrypto.com])
AC_CONFIG_SRCDIR([src])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([build-aux/m4])
AC_CONFIG_FILES([Makefile])

AC_CANONICAL_HOST

# The user can disable building of the PDF of the manual, for example
# if the required LaTeX packages are not installed
AC_ARG_ENABLE([pdf-doc],
    [AS_HELP_STRING([--disable-pdf-doc],[disable building the PDF documentation from LaTeX source])],
    [pdfdoc=no],
    [pdfdoc=yes])

AC_PROG_LATEX

if test "x$pdfdoc" = "xyes"; then
   AC_MSG_NOTICE([building of the PDF of the documents from LaTeX source is enabled])
   AC_PROG_PDFLATEX
fi

AC_ARG_ENABLE([html-doc],
    [AS_HELP_STRING([--disable-html-doc],[disable building the HTML documentation from LaTeX source])],
    [htmldoc=no],
    [htmldoc=yes])

if test "x$htmldoc" = "xyes"; then
   AC_MSG_NOTICE([building of the HTML of the documents from LaTeX source is enabled])
   AC_PROG_HTLATEX
fi


AM_INIT_AUTOMAKE(subdir-objects foreign)

AM_CONDITIONAL([HAVE_PDFLATEX], test -n "$PDFLATEX")
AM_CONDITIONAL([HAVE_HTLATEX], test -n "$HTLATEX")
AM_CONDITIONAL([BUILD_pdfdoc], test "x$pdfdoc" = "xyes")
AM_CONDITIONAL([BUILD_htmldoc], test "x$htmldoc" = "xyes")

AC_OUTPUT

