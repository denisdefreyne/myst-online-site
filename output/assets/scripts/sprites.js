function setup(id)
{
	$(id).mouseover(function() {
		var hover = $(id + ' div.hover');

		if(hover.length == 0)
		{
			$(this).append('<div class="hover"></div>');
			hover = $(id + ' div.hover');
			hover.css({ opacity: 0.0 });
		}
		else
			hover.stop();

		hover.fadeTo(200, 1.0);
	}).mouseout(function() {
		$(id + ' div.hover').stop().fadeTo(500, 0.0, function() {
			$(this).remove();
		});
	});
}

$(document).ready(function() {
	$('#header a').each(function() {
	    $(this).css({ backgroundImage: 'none' });
	})
	$('#nav a').each(function() {
	    $(this).css({ backgroundImage: 'none' });
	});

	setup('#link-home');
	setup('#nav-home');
	setup('#nav-play');
	setup('#nav-about');
	setup('#nav-forums');
	setup('#nav-media');
	setup('#nav-developers');
});
