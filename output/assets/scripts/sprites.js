function setup(id)
{
	$(id).mouseover(function() {
		$(this).append('<div class="hover"></div>');
		$(id + ' div.hover').css({ display: 'none' }).fadeIn(200);
	}).mouseout(function() {
		$(id + ' div.hover').fadeOut(200, function() {
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
