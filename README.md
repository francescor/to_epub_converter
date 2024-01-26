# to_epub_converter

convert files in directory to EPUB format

```
to_epub_converter.sh ~/tmp/input ~/tmp/output pdf,txt,doc
```

see https://github.com/francescor/to_epub_converter


## Nextcloud

The script `nextcloud_to_epub_converter.sh` should serve in cron to convert files in Nextcloud, e.g.

```
* * * * * /root/scripts/cron/to_epub_converter/nextcloud_to_epub_converter.sh > /dev/null
```


