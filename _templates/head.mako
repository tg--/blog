<title>${bf.config.blog.name}</title>
<link rel="alternate" type="application/atom+xml" title="Atom 1.0"
href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />
<link rel="stylesheet" href="${bf.config.filters.syntax_highlight.css_dir}/pygments_${bf.config.filters.syntax_highlight.style}.css" type='text/css' />
<link rel="stylesheet" href="${bf.util.site_path_helper('css/base.css?v=1')}" type='text/css' />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />

%if post:
## You can put post meta tags here: date, author, copyright etc.
<meta http-equiv="date" content="${post.date.isoformat()}" />
%endif
