# to_epub_converter

convert files in directory to EPUB format

```
to_epub_converter.sh ~/tmp/input ~/tmp/output pdf,txt,doc
```

see https://github.com/francescor/to_epub_converter

This script has been created to convert mainly PDF files to EPUB.
Conversion is done thanks to Calibre https://calibre-ebook.com (for PDF to EPUB see https://manual.calibre-ebook.com/en/conversion.html#convert-pdf-documents )

## Nextcloud

The script `nextcloud_to_epub_converter.sh` has been create to be used in cron to convert Users' files in Nextcloud, e.g.

```
* * * * * /root/scripts/cron/to_epub_converter/nextcloud_to_epub_converter.sh > /dev/null
```

## Requirement

`ebook-convert` from Calibre https://calibre-ebook.com/


