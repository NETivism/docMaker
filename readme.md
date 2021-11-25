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

2. We aleady download [hugo theme learn](https://github.com/matcornic/hugo-theme-learn)

3. Build html file with default config.toml
Run this command and you will get html file in public folder.
```bash
hugo
```

# Update theme

We have modified some theme tempalte and css.
Make sure test before publish
Run this command to clone the theme from github if themes/book folder is empty:
```bash
cd /tmp
git clone https://github.com/matcornic/hugo-theme-learn
cp -R hugo-theme-learn/* themes/hugo-theme-learn/
```
