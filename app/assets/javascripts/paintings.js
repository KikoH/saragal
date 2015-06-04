$(window).ready(function(){
	$('#book').turn({
		display: 'double',
		duration: '600',
		gradients: true,
		elevation: 0
	});
});

$(window).bind('keydown', function(e) {
	if (e.keyCode== 37)
		$('#book').turn('previous');
	else if (e.keyCode==39)
		$('#book').turn('next');
});