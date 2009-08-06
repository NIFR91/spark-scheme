;; HTTP mime types.
;; Copyright (C) 2007, 2008, 2009 Vijay Mathew Pandyalakal
 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
  
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
  
;; You should have received a copy of the GNU General Public License along
;; with this program; If not, see <http://www.gnu.org/licenses/>.
  
;; Please contact Vijay Mathew Pandyalakal if you need additional 
;; information or have any questions.
;; (Electronic mail: vijay.the.schemer@gmail.com)

(library mime-types
	 
	 (export find-mime-type)
	 
	 (define mime-types (list 
			     (cons #"html" "text/html")
			     (cons #"htm" "text/html")
			     (cons #"ss" "text/html")
			     (cons #"scm" "text/html")
			     (cons #"asc" "text/plain")
			     (cons #"css" "text/css")
			     (cons #"shtml" "text/html")
			     (cons #"txt" "text/plain")
			     (cons #"rtx" "text/richtext")
			     (cons #"rtf" "text/rtf")
			     (cons #"sgml" "text/sgml")
			     (cons #"sgm" "text/sgml")
			     (cons #"jpeg" "image/jpeg")
			     (cons #"jpg" "image/jpeg")
			     (cons #"jpe" "image/jpeg")
			     (cons #"png" "image/png")
			     (cons #"svg" "image/svg+xml")
			     (cons #"tiff" "image/tiff")
			     (cons #"tif" "image/tiff")
			     (cons #"cgm" "image/cgm")
			     (cons #"bmp" "image/bmp")
			     (cons #"gif" "image/gif")
			     (cons #"ief" "image/ief")
			     (cons #"js" "application/x-javascript")
			     (cons #"xhtml" "application/xhtml+xml")
			     (cons #"xht" "application/xhtml+xml")
			     (cons #"xml" "application/xml")
			     (cons #"xsl" "application/xml")
			     (cons #"dtd" "application/xml-dtd")
			     (cons #"xslt" "application/xslt+xml")
			     (cons #"zip" "application/zip")
			     (cons #"doc" "application/msword")
			     (cons #"lha" "application/octet-stream")
			     (cons #"lzh" "application/octet-stream")
			     (cons #"exe" "application/octet-stream")
			     (cons #"class" "application/octet-stream")
			     (cons #"so" "application/octet-stream")
			     (cons #"dll" "application/octet-stream")
			     (cons #"oda" "application/oda")
			     (cons #"ogg" "application/ogg")
			     (cons #"pdf" "application/pdf")
			     (cons #"ps" "application/postscript")
			     (cons #"xul" "application/vnd.mozilla.xul+xml")
			     (cons #"xls" "application/vnd.ms-excel")
			     (cons #"ppt" "application/vnd.ms-powerpoint")
			     (cons #"wbxml" "application/vnd.wap.wbxml")
			     (cons #"wmlc" "application/vnd.wap.wmlc")
			     (cons #"wmlsc" "application/vnd.wap.wmlscriptc")
			     (cons #"vxml" "application/voicexml+xml")
			     (cons #"ez" "application/andrew-inset")			     
			     (cons #"hqx" "application/mac-binhex40")
			     (cons #"cpt" "application/mac-compactpro")
			     (cons #"mathml" "application/mathml+xml")
			     (cons #"bin" "application/octet-stream")
			     (cons #"dms" "application/octet-stream")
			     (cons #"ai" "application/postscript")
			     (cons #"eps" "application/postscript")
			     (cons #"rdf" "application/rdf+xml")
			     (cons #"smi" "application/smil")
			     (cons #"smil" "application/smil")
			     (cons #"gram" "application/srgs")
			     (cons #"grxml" "application/srgs+xml")
			     (cons #"mif" "application/vnd.mif")
			     (cons #"bcpio" "application/x-bcpio")
			     (cons #"vcd" "application/x-cdlink")
			     (cons #"pgn" "application/x-chess-pgn")
			     (cons #"cpio" "application/x-cpio")
			     (cons #"csh" "application/x-csh")
			     (cons #"dcr" "application/x-director")
			     (cons #"dir" "application/x-director")
			     (cons #"dxr" "application/x-director")
			     (cons #"dvi" "application/x-dvi")
			     (cons #"spl" "application/x-futuresplash")
			     (cons #"gtar" "application/x-gtar")
			     (cons #"hdf" "application/x-hdf")
			     (cons #"php" "application/x-httpd-php")
			     (cons #"php4" "application/x-httpd-php")
			     (cons #"php3" "application/x-httpd-php")
			     (cons #"phtml" "application/x-httpd-php")
			     (cons #"phps" "application/x-httpd-php-source")
			     (cons #"skp" "application/x-koan")
			     (cons #"skd" "application/x-koan")
			     (cons #"skt" "application/x-koan")
			     (cons #"skm" "application/x-koan")
			     (cons #"latex" "application/x-latex")
			     (cons #"nc" "application/x-netcdf")
			     (cons #"cdf" "application/x-netcdf")
			     (cons #"crl" "application/x-pkcs7-crl")
			     (cons #"sh" "application/x-sh")
			     (cons #"shar" "application/x-shar")
			     (cons #"swf" "application/x-shockwave-flash")
			     (cons #"sit" "application/x-stuffit")
			     (cons #"sv4cpio" "application/x-sv4cpio")
			     (cons #"sv4crc" "application/x-sv4crc")
			     (cons #"tgz" "application/x-tar")
			     (cons #"tar" "application/x-tar")
			     (cons #"tcl" "application/x-tcl")
			     (cons #"tex" "application/x-tex")
			     (cons #"texinfo" "application/x-texinfo")
			     (cons #"texi" "application/x-texinfo")
			     (cons #"t" "application/x-troff")
			     (cons #"tr" "application/x-troff")
			     (cons #"roff" "application/x-troff")
			     (cons #"man" "application/x-troff-man")
			     (cons #"me" "application/x-troff-me")
			     (cons #"ms" "application/x-troff-ms")
			     (cons #"ustar" "application/x-ustar")
			     (cons #"src" "application/x-wais-source")
			     (cons #"crt" "application/x-x509-ca-cert")
			     (cons #"au" "audio/basic")
			     (cons #"snd" "audio/basic")
			     (cons #"mid" "audio/midi")
			     (cons #"midi" "audio/midi")
			     (cons #"kar" "audio/midi")
			     (cons #"mpga" "audio/mpeg")
			     (cons #"mp2" "audio/mpeg")
			     (cons #"mp3" "audio/mpeg")
			     (cons #"aif" "audio/x-aiff")
			     (cons #"aiff" "audio/x-aiff")
			     (cons #"aifc" "audio/x-aiff")
			     (cons #"m3u" "audio/x-mpegurl")
			     (cons #"ram" "audio/x-pn-realaudio")
			     (cons #"rm" "audio/x-pn-realaudio")
			     (cons #"rpm" "audio/x-pn-realaudio-plugin")
			     (cons #"ra" "audio/x-realaudio")
			     (cons #"wav" "audio/x-wav")
			     (cons #"pdb" "chemical/x-pdb")
			     (cons #"xyz" "chemical/x-xyz")
			     (cons #"djvu" "image/vnd.djvu")
			     (cons #"djv" "image/vnd.djvu")
			     (cons #"wbmp" "image/vnd.wap.wbmp")
			     (cons #"ras" "image/x-cmu-raster")
			     (cons #"ico" "image/x-icon")
			     (cons #"pnm" "image/x-portable-anymap")
			     (cons #"pbm" "image/x-portable-bitmap")
			     (cons #"pgm" "image/x-portable-graymap")
			     (cons #"ppm" "image/x-portable-pixmap")
			     (cons #"rgb" "image/x-rgb")
			     (cons #"xbm" "image/x-xbitmap")
			     (cons #"xpm" "image/x-xpixmap")
			     (cons #"xwd" "image/x-xwindowdump")
			     (cons #"igs" "model/iges")
			     (cons #"iges" "model/iges")
			     (cons #"msh" "model/mesh")
			     (cons #"mesh" "model/mesh")
			     (cons #"silo" "model/mesh")
			     (cons #"wrl" "model/vrml")
			     (cons #"vrml" "model/vrml")
			     (cons #"ics" "text/calendar")
			     (cons #"ifb" "text/calendar")
			     (cons #"tsv" "text/tab-separated-values")
			     (cons #"wml" "text/vnd.wap.wml")
			     (cons #"wmls" "text/vnd.wap.wmlscript")
			     (cons #"etx" "text/x-setext")
			     (cons #"mpeg" "video/mpeg")
			     (cons #"mpg" "video/mpeg")
			     (cons #"mpe" "video/mpeg")
			     (cons #"qt" "video/quicktime")
			     (cons #"mov" "video/quicktime")
			     (cons #"mxu" "video/vnd.mpegurl")
			     (cons #"avi" "video/x-msvideo")
			     (cons #"movie" "video/x-sgi-movie")
			     (cons #"ice" "x-conference/x-cooltalk")))

	 (define (find-mime-type file-name)
	   (assoc (filename-extension file-name) mime-types)))