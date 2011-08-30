<div id=navigation>
  <div id=nav_header>
    <a href="${bf.util.site_path_helper()}">${bf.config.blog.name}</a>
  </div>
  <ul id=nav_main>
    <li class=nav_item><a href="${bf.config.util.site_path_helper(bf.config.blog.path)}">Blog</a></li>
    % for post in bf.config.blog.posts[:5]:
       <li class="nav_post"><a href="${post.path}">${post.title}</a></li>
    % endfor
    <li class=nav_item><a href="${bf.config.blog.url}/archive">Archive</a></li>
  </ul>
</div>
