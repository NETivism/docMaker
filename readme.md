# How to use

1. Clone folder to root of civicrm.

2. Write comments between `@docmaker_start` and `@docmaker_end` in `tests/phpunit/api/v3/{entity}Test.php`. Example usage:
```
  /**
   * Participant Create Unit Test
   *
   * @docmaker_start
   *
   * @api_entity Participant
   * @api_action Create
   * @http_method POST
   * @request_content_type application/json
   * @request_url <entrypoint>?entity=Participant&action=create
   * @request_body {$request_body}
   * @api_explorer /civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=get&pretty=1&json={$request_body_inline}
   * @response_body {$response_body}
   *
   * @docmaker_end
   */
```

3. Go to API tests folder and run `phpunit {entity}Test.php` to generate request and response json files in folder `unit_test_result`

4. Enter docMaker folder. Execute command `php genDoc.php {entity}`.

5. Markdown result file will be generated to `api-document/3/{entity}/index.html`.

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

2. The hugo theme [hugo theme learn](https://github.com/matcornic/hugo-theme-learn) is already inside themes. We made a little change to this theme for better use of iframe embed scenario.

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
