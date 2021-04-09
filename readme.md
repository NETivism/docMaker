# How to use

1. Clone folder to root of civicrm.

2. There need paragraph between `@start_document` and `@end_document` used in comment of file `api/v3/xxx.php`.

3. Enter docMaker folder.

4. Execute `php genDoc.php xxx`.

5. Markdown result file will be generated in `markdown` folder.

# Generate html document using hugo

1. Install hugo
```bash
curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
 | grep  browser_download_url \
 | grep Linux-64bit.deb \
 | grep extended \
 | cut -d '"' -f 4 \
 | wget -i - \
 && dpkg -i hugo*_Linux-64bit.deb
 ```

2. Get hugo [themes/book](https://github.com/alex-shpak/hugo-book)
Run this command to clone the theme from github if themes/book folder is empty:
```bash
git submodule update --init
```

3. Build html file
Run this command and you will get html file in public folder.
```bash
hugo
```