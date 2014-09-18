# $NetBSD$
# Default list for reducing PLIST
PLIST_MINUS=	core
DEPENDS+=	gnuradio-core-[0-9]*:../../wip/gnuradio-core

# Remove the same files gnuradio-core installs
# Do a part of PLIST_SUBST and remove non real file listings
#.if empty(PKGBASE:Mgnuradio-core) && !empty(PLIST_MINUS)
post-install:
# Take care CONF_FILES stuff
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/${EGDIR}
	${MV}		    ${DESTDIR}${PREFIX}/etc/gnuradio/conf.d/* \
			    ${DESTDIR}${PREFIX}/${EGDIR}/
# to avoid sh: /bin/rm: argument list too long in case repeated..
	${RM} -f ${WRKDIR}/.PLIST.minus;
	for i in ${PLIST_MINUS} ; do			\
	  sed  -e 's,$${PYSITELIB},${PYSITELIB},'	\
	       -e 's,$${PKGVERSION},${PKGVERSION},'	\
	       -e '/^@comment/d'			\
	       -e '/^@pkgdir/d'				\
	       ${PKGDIR}/../../wip/gnuradio-$$i/PLIST	\
		 >> ${WRKDIR}/.PLIST.minus;		\
		done;					\
	  (cd ${WRKDIR}/.destdir/${PREFIX};		\
	${RM} -f `cat ${WRKDIR}/.PLIST.minus`	);
