<p id="credits">
<br/>
Atom feeds for <a href="${bf.util.site_path_helper(bf.config.blog.path,'feed')}">Entries</a><br/>
&copy; 2010-2012 Thomas Gstaedtner - <a href="https://gitorious.org/tg">site-sources available</a><br/>
Unless stated otherwise, all textual and visual (image/video) content by me can be used under the<br/>
<a href="http://creativecommons.org/licenses/by-sa/3.0/">CC BY-SA 3.0</a> or <a href="http://www.gnu.org/licenses/fdl.html">GNU FDL 1.3</a> licenses.<br/>
% if bf.config.blog.disqus.enabled:
 and <a
href="http://${bf.config.blog.disqus.name}.disqus.com/latest.rss">Comments</a>.
% endif
<br>
</p>
% if bf.config.blog.disqus.enabled:
<script type="text/javascript">
//<![CDATA[
(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
			if(links[i].href.indexOf('#disqus_thread') >= 0) {
				query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
			}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/get_num_replies.js' + query + '"></' + 'script>');
	})();
//]]>
</script>
% endif
