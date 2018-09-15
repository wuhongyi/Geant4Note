# gitbook-plugin-redirect

Preprocess your Markdown files, replacing all instances of

```
!REDIRECT "NEW_PATH"
```

with a redirect to the specified path. The path can be absolute(`/new/path`), or relative(`../new/path`) or a URI(`http://example.com/new/path`).

## Usage

Add to your `book.json` plugin list:
```
{
    "plugins" : [ "redirect" ],
}
```



