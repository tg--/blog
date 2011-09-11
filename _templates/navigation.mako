<div id=navigation>
  <div id=nav_header>
    <a href="${bf.util.site_path_helper()}">${bf.config.blog.name}</a>
  </div>
  <ul id=nav_main>
    <li class=nav_item><a href="${bf.config.util.site_path_helper(bf.config.blog.path)}">Posts</a></li>
    % for post in bf.config.blog.posts[:5]:
       <li class="nav_post"><a href="${post.path}">${post.title}</a></li>
    % endfor
    <li class=nav_item>Categories</li>
    % for category, num_posts in bf.config.blog.all_categories:
      <li class="nav_post"><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">feed</a>) (${num_posts})</li>
    % endfor
    <li class=nav_item><a href="${bf.config.blog.url}/archive">Archive</a></li>
  </ul>
</div>
