
/******************************************************************************/
/******************************************************************************/

function getRandom(min,max)
{
	return((Math.floor(Math.random()*(max-min)))+min);
}

/******************************************************************************/

function blockForm(formId,action)
{
	if(action=='block')
		$('#'+formId).find('.block').block({message:false,overlayCSS:{opacity:'0.3'}});
	else $('#'+formId).find('.block').unblock();
}

/******************************************************************************/

function blink(element)
{
	$(element).animate({opacity:($(element).css('opacity')==1 ? 0.2 : 1)},500,function() { blink($(this)); });
};

/******************************************************************************/

function getResponsiveStep()
{
	var step=0;
	var windowWidth=$(window).width();

	if((windowWidth<=969) && (windowWidth>768)) step=1;
	if((windowWidth<=767) && (windowWidth>480)) step=2;
	if((windowWidth<=479)) step=3;

	return(step);
}

/******************************************************************************/

function setTwitterDimension()
{
	var object=$('#latest-tweets');
	var list=object.find('ul:first');

	var width=object.width();
	var height=object.height();

	var widthItem=width-parseInt(object.children('.caroufredsel_wrapper').css('margin-left'));

	object.find('ul').trigger('configuration',{items:{width:widthItem,height:height}});
	object.find('ul li,ul li p').css({width:width,height:height});

	list.trigger('updateSizes');
}

/******************************************************************************/

function setImageListDimension()
{
	jQuery('.image-list.image-list-carousel').each(function()
	{
		var itemCount=[[4],[3],[2],[1]];
		var responsiveStep=getResponsiveStep();

		$(this).trigger('configuration',{items:{visible:itemCount[responsiveStep][0]}});
		$(this).trigger('configuration',{items:{minimum:itemCount[responsiveStep][0]+1}});
		$(this).trigger('updateSizes');
	});
}

/******************************************************************************/
/******************************************************************************/
