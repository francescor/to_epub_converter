# to_epub_converter

convert files in directory to EPUB format

```
to_epub_converter.sh ~/tmp/input ~/tmp/output pdf,txt,doc
```

see https://github.com/francescor/to_epub_converter

This script has been created to convert mainly PDF files to EPUB.
Conversion is done thanks to Calibre https://calibre-ebook.com (for PDF to EPUB see https://manual.calibre-ebook.com/en/conversion.html#convert-pdf-documents )

## Input formats

See https://manual.calibre-ebook.com/faq.html

Input Formats: AZW, AZW3, AZW4, CBZ, CBR, CB7, CBC, CHM, DJVU, DOCX, EPUB, FB2, FBZ, HTML, HTMLZ, LIT, LRF, MOBI, ODT, PDF, PRC, PDB, PML, RB, RTF, SNB, TCR, TXT, TXTZ

Output Formats: hard coded to EPUB

## Nextcloud

The script `nextcloud_to_epub_converter.sh` has been create to be used in cron to convert Users' files in Nextcloud, e.g.

```
* * * * * /root/scripts/cron/to_epub_converter/nextcloud_to_epub_converter.sh > /dev/null
```

## Requirement

`ebook-convert` from Calibre https://calibre-ebook.com/


