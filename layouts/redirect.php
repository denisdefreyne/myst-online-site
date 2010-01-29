<?php

// Configuration
$base_url  = '<%= @site.config[:base_url] %>';
$page_path = '<%= @item_rep.path %>';

// Build mapping (see Localization helper for details)
$path_mapping = array(
<% MOULSite::Helpers::Localization::CANONICAL_IDENTIFIER_MAPPING.each_pair do |language_code, mapping| %>
	'<%= language_code %>' => array(
<% mapping.each_pair do |original, translated| %>
		'<%= original %>' => '<%= translated %>',
<% end %>
	),
<% end %>
);

// Parse Accept-Language headers
$langs = array();
if(isset($_SERVER['HTTP_ACCEPT_LANGUAGE']))
{
	// Parse language
	// e.g. en-ca,en;q=0.8,en-us;q=0.6,de-de;q=0.4,de;q=0.2
	preg_match_all('/([a-z]{1,8}(-[a-z]{1,8})?)\s*(;\s*q\s*=\s*(1|0\.[0-9]+))?/i', $_SERVER['HTTP_ACCEPT_LANGUAGE'], $lang);

	if(count($lang[1]) > 0)
	{
		// Create key-value pair
		$langs = array_combine($lang[1], $lang[4]);

		// Use default q value of 1
		foreach ($langs as $lang => $val)
		{
			if ($val === '')
				$langs[$lang] = 1;
		}

		// Sort based on q value
		arsort($langs, SORT_NUMERIC);
	}
}

function redirect($lang)
{
	global $base_url, $page_path, $path_mapping;

	if($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1')
		header('HTTP/1.1 303 See Other');
	else
		header('HTTP/1.0 302 Moved Temporarily');

	header('Location: ' . $base_url . '/' . $lang . $path_mapping[$lang][$page_path]);

	exit();
}

// Show correct site
foreach($langs as $request_lang => $qval)
{
	$site_languages = array_keys($path_mapping);
	foreach($site_languages as $site_lang)
	{
		if(strpos($request_lang, $site_lang) === 0)
			redirect($site_lang);
	}
}
redirect('en');

?>