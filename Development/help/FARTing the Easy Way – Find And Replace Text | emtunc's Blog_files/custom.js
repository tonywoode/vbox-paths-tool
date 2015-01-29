
// ---------------------------------------------------------
// jQuery
// ---------------------------------------------------------
jQuery(document).ready(function($) {

		// ---------------------------------------------------------
		// Initiate Pretty Photo
		// ---------------------------------------------------------
		
		$("a[rel^='prettyPhoto']").prettyPhoto({
		        theme: 'light_square', /*  facebook /light_rounded / dark_rounded / light_square / dark_square*/
		        show_title: false
		});
		
		
		
		// ---------------------------------------------------------
		// Initiate Portfolio hover effect
		// ---------------------------------------------------------
		$('a.portfolio-thumbnail').each(function(){
		    if(this.href.match(/\.(jpe?g|png|bmp|gif|tiff?)$/i)){
		        $(this).addClass('look');
		    } else {
		        $(this).addClass('play');
		    }
		});
		
		
		$('a.portfolio-thumbnail').hover(function() {
		    //Transparent thumbnail image.
		    $(this).find('img').stop(true, true).animate({opacity:0.5},400);
		}, function() {
		    //Normal thumbnail image.
		    $(this).find('img').stop(true, true).animate({opacity:1},400);
		});
		
		
		
	
}); //End jQuery