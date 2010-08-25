<?php
# $NetBSD: pear_plist.php,v 1.7 2009/06/14 22:58:02 joerg Exp $
# Parses package XML file and outputs appropriate PLIST

include_once "PEAR/Registry.php";
include_once "PEAR/PackageFile.php";

$PREFIX = getenv('PREFIX');
$PEAR_LIB = getenv('PEAR_LIB');
$WRKSRC = getenv('WRKSRC');
if(! $DESTDIR = getenv('DESTDIR')) $DESTDIR='';

$config = &PEAR_Config::singleton();
$package = &new PEAR_PackageFile($config);
$info = $package->fromAnyFile("$WRKSRC/package.xml", PEAR_VALIDATE_INSTALLING);

$pkg = $info->getName();
$channel = $info->getChannel();

$registry = &new PEAR_Registry($DESTDIR.$PREFIX."/".$PEAR_LIB);
$flist = $registry->packageInfo($pkg, 'filelist', $channel);

$regfile = $PEAR_LIB.'/.registry/.channel.'.$channel.'/'.strtolower($pkg).'.reg';
if (!file_exists($DESTDIR.$PREFIX.'/'.$regfile)) {
	$regfile = $PEAR_LIB.'/.registry/'.strtolower($pkg).'.reg';
}
echo "$regfile\n";
# output list of package files, in same order as specified in package
foreach($flist as $f) {
	echo str_replace($PREFIX.'/','', $f['installed_as'])."\n";
}
?>
