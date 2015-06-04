$(document).ready(function(){
	$('#book').turn({
		autoCenter: false
	});
});

$(window).bind('keydown', function(e) {
	if (e.keyCode== 37)
		$('#book').turn('previous');
	else if (e.keyCode==39)
		$('#book').turn('next');
});