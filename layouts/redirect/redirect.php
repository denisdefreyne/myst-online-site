<?php

// Configuration
$base_url  = '<%= @page.base_url %>';
$page_path = '<%= @page.path %>';
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

	header('Location: ' . $base_url . '/' . $lang . $path_mapping[$lang][$page_path]);

	exit();
}

// Show correct site
foreach($langs as $lang => $qval)
{
	if(strpos($lang, 'de') === 0)
		redirect('de');
	else if(strpos($lang, 'es') === 0)
		redirect('es');
	else if(strpos($lang, 'fr') === 0)
		redirect('fr');
	else if(strpos($lang, 'it') === 0)
		redirect('it');
	else if(strpos($lang, 'nl') === 0)
		redirect('nl');
}
redirect('en');

?>