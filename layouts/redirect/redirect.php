<?php

// Configuration
$base_url  = '<%= @site.config[:base_url] %>';
$page_path = '<%= @item_rep.path %>';
$path_mapping = array(
	'en' => array(
		'/'                   => '/',
		'/play/'              => '/play/',
		'/about/'             => '/about/',
		'/about/news/'        => '/about/news/',
		'/media/'             => '/media/',
		'/media/screenshots/' => '/media/screenshots/',
		'/media/concept-art/' => '/media/concept-art/',
		'/developers/'        => '/developers/'
	),
	'de' => array(
		'/'                   => '/',
		'/play/'              => '/spielen/',
		'/about/'             => '/info/',
		'/about/news/'        => '/info/news/',
		'/media/'             => '/medien/',
		'/media/screenshots/' => '/medien/screenshots/',
		'/media/concept-art/' => '/medien/concept-art/',
		'/developers/'        => '/entwickler/'
	),
	'es' => array(
		'/'                   => '/',
		'/play/'              => '/jugar/',
		'/about/'             => '/info/',
		'/about/news/'        => '/info/noticias/',
		'/media/'             => '/galeria/',
		'/media/screenshots/' => '/galeria/capturas/',
		'/media/concept-art/' => '/galeria/arte-conceptual/',
		'/developers/'        => '/desarrolladores/'
	),
	'fi' => array(
		'/'                   => '/',
		'/play/'              => '/pelaa/',
		'/about/'             => '/tietoa/',
		'/about/news/'        => '/tietoa/uutisia/',
		'/media/'             => '/media/',
		'/media/screenshots/' => '/media/kuvakaappauksia/',
		'/media/concept-art/' => '/media/luonnoksia/',
		'/developers/'        => '/tuotekehittelijat/'
	),
	'fr' => array(
		'/'                   => '/',
		'/play/'              => '/jouez/',
		'/about/'             => '/informations/',
		'/about/news/'        => '/informations/nouvelles/',
		'/media/'             => '/medias/',
		'/media/screenshots/' => '/medias/captures-d-ecran/',
		'/media/concept-art/' => '/medias/concepts-artistiques/',
		'/developers/'        => '/developpeurs/'
	),
	'it' => array(
		'/'                   => '/',
		'/play/'              => '/gioca/',
		'/about/'             => '/informazioni/',
		'/about/news/'        => '/informazioni/notizie/',
		'/media/'             => '/media/',
		'/media/screenshots/' => '/media/immagini/',
		'/media/concept-art/' => '/media/concept-art/',
		'/developers/'        => '/sviluppatori/'
	),
	'nl' => array(
		'/'                   => '/',
		'/play/'              => '/speel/',
		'/about/'             => '/over/',
		'/about/news/'        => '/over/nieuws/',
		'/media/'             => '/media/',
		'/media/screenshots/' => '/media/schermafbeeldingen/',
		'/media/concept-art/' => '/media/ontwerpschetsen/',
		'/developers/'        => '/ontwikkelaars/'
	)
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