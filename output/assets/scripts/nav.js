// This is a fix to make the navigation work in IE. Also, it keeps the main button
// highlighted while hovering over the sub-buttons.

// We're doing this with JavaScript, because IE doesn't like :hover on non-a elements,
// and because the fix works in Safari and Firefox as well, we're not bothering
// implementing it in a different way for these browsers.

var navigationElementNames = [ 'home', 'play', 'about', 'forums', 'media', 'development' ];

for(var i = 0; i < navigationElementNames.length; ++i)
{
	var element = document.getElementById('nav-' + navigationElementNames[i]);

	element.onmouseover = function() { this.className = 'on';  }
	element.onmouseout  = function() { this.className = 'off'; }
}
