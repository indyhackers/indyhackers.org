
$(document).ready(function()
                  {

  /**************************************************************************/
  /*	Template options													  */
  /**************************************************************************/

  var options=
    {
    twitter:
      {
      name		:	'indyhackersorg',
      count		:	10
    },
    supersized		:
      {
      slide		:
        [
          {image	: '/holiday-social-2013/image/background/01.jpg'},
      {image	: '/holiday-social-2013/image/background/05.jpg'}
      ]
    },
    googleMap		:
      {
      coordinates	:	[39.848809,-86.141656]
    }
  }

  /**************************************************************************/
  /*	Supersized															  */
  /**************************************************************************/

  $.supersized(
    {
    slides					: options.supersized.slide,
    autoplay				: true,
    thumb_links				: false,
    start_slide				: 1,
    thumbnail_navigation	: false
  });

  /**************************************************************************/
  /*	Accordion															  */
  /**************************************************************************/

  $('.nostalgia-accordion').accordion(
    {
    icons		: '',
    active		: 0,
    animated	: 'easeOutExpo',
    collapsible	: true,
    heightStyle : "content"
  });

  /**************************************************************************/
  /*	Google Maps															  */
  /**************************************************************************/

  try
  {
    var coordinate=new google.maps.LatLng(options.googleMap.coordinates[0],options.googleMap.coordinates[1]);

    var mapOptions=
      {
      zoom				: 15,
      center				: coordinate,
      streetViewControl	: false,
      mapTypeControl		: false,
      zoomControlOptions	:
        {
        position		: google.maps.ControlPosition.RIGHT_CENTER
      },
      panControlOptions:
        {
        position		: google.maps.ControlPosition.LEFT_CENTER
      },
      mapTypeId			: google.maps.MapTypeId.ROADMAP
    };

    var googleMap=new google.maps.Map(document.getElementById('map'),mapOptions);

    var markerOptions=
      {
      map:googleMap,
      position:coordinate,
      icon:'/holiday-social-2013/image/map_pointer.png'
    }

    var googleMarker=new google.maps.Marker(markerOptions);

  }
  catch(e) {}

  /**************************************************************************/
  /*	Forms																  */
  /**************************************************************************/

  $('#contact-form').bind('submit',function(e)
                          {
                            e.preventDefault();
                            submitContactForm();
                          });

                          $('#newsletter-form').bind('submit',function(e)
                                                     {
                                                       e.preventDefault();
                                                       submitNewsletterForm();
                                                     });

                                                     $('textarea').elastic();
                                                     $('form label').inFieldLabels();

  /**************************************************************************/
  /*	Contact details button												  */
  /**************************************************************************/

  $('#contact-details-button').bind('click',function(e)
                                    {
                                      e.preventDefault();

                                      var contactDetails=$(this).parent('.contact-details');

                                      var top=parseInt(contactDetails.css('top'));
                                      var newTop=(top==0 ? parseInt(contactDetails.height()) : 0);

                                      contactDetails.animate({top:-1*newTop},{duration:100,complete:function()
                                                             {

                                                             }});
                                    });

  /**************************************************************************/
  /*	Twitter																  */
  /**************************************************************************/

  $.getJSON('http://api.twitter.com/1/statuses/user_timeline/'+options.twitter.name+'.json?count='+options.twitter.count+'&callback=?',function(data)
            {
              if(data.length)
                {
                  var list=$('<ul>');
                  $(data).each(function(index,value)
                               {
                                 list.append($('<li>').append($('<p>').html(linkify(value.text))));
                               });

                               $('#latest-tweets').append(list);

                               $('#latest-tweets ul').carouFredSel(
                                 {
                                 circular		:	true,
                                 direction		:	'up',
                                 items:
                                   {
                                   visible		: 1,
                                   minimum		: 1
                                 },
                                 scroll:
                                   {
                                   items		: 1,
                                   duration	: 750,
                                   fx			: 'cover'
                                 }
                               });

                               setTwitterDimension();
                }
            });

  /**************************************************************************/
  /*	Image preloader														  */
  /**************************************************************************/

  $('.preloader img').each(function()
                           {
                             $(this).attr('src',$(this).attr('src') + '?i='+getRandom(1,100000));
                             $(this).bind('load',function()
                                          {
                                            $(this).parent().first().css('background-image','none');
                                            $(this).animate({opacity:1},1000);
                                          });
                           });

  /**************************************************************************/
  /*	Image carousel														  */
  /**************************************************************************/

  $('.image-list.image-list-carousel').carouFredSel(
    {
    circular		:	true,
    direction		:	'left',
    scroll:
      {
      items		: 1,
      duration	: 750
    },
    prev			: $('.image-list.image-list-carousel').nextAll('.image-list-carousel-navigation-prev'),
    next			: $('.image-list.image-list-carousel').nextAll('.image-list-carousel-navigation-next')
  });

  /**************************************************************************/
  /*	Fancybox for images													  */
  /**************************************************************************/

  $('.fancybox-image').fancybox({});

  /**************************************************************************/
  /*	Fancybox for youtube videos											  */
  /**************************************************************************/

  $('.fancybox-video-youtube').bind('click',function()
                                    {
                                      $.fancybox(
                                        {
                                        'padding'		: 10,
                                        'autoScale'		: false,
                                        'transitionIn'	: 'none',
                                        'transitionOut'	: 'none',
                                        'width'			: '90%',
                                        'height'		: '90%',
                                        'href'			: this.href,
                                        'type'			: 'iframe'
                                      });

                                      return false;
                                    });

  /**************************************************************************/
  /*	Fancybox for vimeo videos											  */
  /**************************************************************************/

  $('.fancybox-video-vimeo').bind('click',function()
                                  {
                                    $.fancybox(
                                      {
                                      'margin'		: 0,
                                      'padding'		: 0,
                                      'autoScale'		: false,
                                      'transitionIn'	: 'none',
                                      'transitionOut'	: 'none',
                                      'title'			: this.title,
                                      'width'			: '90%',
                                      'height'		: '90%',
                                      'href'			: this.href,
                                      'type'			: 'iframe'
                                    });

                                    return false;
                                  });

  /**************************************************************************/
  /*	"Clik here" caption													  */
  /**************************************************************************/

  blink($('.click-here'));

  /**************************************************************************/
  /*	Window resize														  */
  /**************************************************************************/

  $(window).resize(function()
                   {
                     setTwitterDimension();
                     setImageListDimension();
                     googleMap.setCenter(googleMarker.getPosition());
                   });

                   $(window).trigger('resize');

  /**************************************************************************/
                  });
