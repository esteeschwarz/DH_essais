function (input, title = "A post from knitr", ..., envir = parent.frame(), 
          shortcode = FALSE, action = c("newPost", "editPost", "newPage"), 
          postid, publish = TRUE) 
{
  do.call("library", list(package = "RWordPress", character.only = TRUE))
  xfun::do_once(warning2("This function is based on the RWordPress package, which is no longer actively ", 
                         "maintained (https://github.com/yihui/knitr/issues/1866). For blogging with R, ", 
                         "you may try the blogdown package instead."), "knitr.knit2wp.warning")
  out = knit(input, envir = envir)
  on.exit(unlink(out))
  content = file_string(out)
  content = markdown::markdownToHTML(text = content, fragment.only = TRUE)
  shortcode = rep(shortcode, length.out = 2L)
  if (shortcode[1]) 
    content = gsub("<pre><code class=\"([[:alpha:]]+)\">(.+?)</code></pre>", 
                   "[sourcecode language=\"\\1\"]\\2[/sourcecode]", 
                   content)
  content = gsub("<pre><code( class=\"no-highlight\"|)>(.+?)</code></pre>", 
                 if (shortcode[2]) 
                   "[sourcecode]\\2[/sourcecode]"
                 else "<pre>\\2</pre>", content)
  content = enc2utf8(content)
  title = enc2utf8(title)
  action = match.arg(action)
  WPargs = list(content = list(description = content, title = title, 
                               ...), publish = publish)
  if (action == "editPost") 
    WPargs = c(postid = postid, WPargs)
  do.call(action, args = WPargs)
}