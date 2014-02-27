<div id=navigation>
  <div id=nav_header>
    <a href="${bf.util.site_path_helper()}">${bf.config.blog.name}</a>
  </div>
  <ul id=nav_main>
    <li class=nav_item><a href="${bf.util.site_path_helper(bf.config.blog.path)}">Posts</a></li>
    % for post in bf.config.blog.posts[:5]:
       <li class="nav_post"><a href="${post.path}">${post.title}</a></li>
    % endfor
    <hr class=nav_post>
    <li class=nav_item>Categories</li>
    % for category, num_posts in bf.config.blog.all_categories:
      <li class="nav_post"><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">feed</a>) (${num_posts})</li>
    % endfor
    <hr class=nav_post>
    <li class=nav_item><a href="${bf.config.blog.url}/archive">Archive</a></li>
    <hr class=nav_post>
    <li class=nav_item>Contact</li>
      <li class="nav_post">Mail: <a href="mailto:thomas@gstaedtner.net">thomas@gstaedtner.net</a></li>
      <li class="nav_post">Jabber: <a href="xmpp:thomas@gstaedtner.net">thomas@gstaedtner.net</a></li>
  </ul>
</div>
