$(document).ready(function() {

  var sync1 = $(".large-image");
  var sync2 = $(".thumbnail-product");
  var sync3 = $(".product-plus")
    sync1.owlCarousel({
        items : 1,
        singleItem : true,
        slideSpeed : 1000,
        navigation: true,
        pagination:false,
        navigationText: [
            '<i class="fa fa-caret-left left_button" aria-hidden="true"></i>',
            '<i class="fa fa-caret-right right_button" aria-hidden="true"></i>'
        ],
        afterAction : syncPosition,
        responsiveRefreshRate : 200,
    });

  sync2.owlCarousel({
    items : 3,
    // itemsDesktop      : [1199,3],
    // itemsDesktopSmall     : [979,3],
    // itemsTablet       : [768,3],
    // itemsMobile       : [479,3],
      slideSpeed : 1000,
     navigation: true,
      navigationText: [
		  '<i class="fa fa-caret-left left_button" aria-hidden="true"></i>',
		  '<i class="fa fa-caret-right right_button" aria-hidden="true"></i>'
		  ],
    responsiveRefreshRate : 100,
    afterInit : function(el){
      el.find(".owl-item").eq(0).addClass("synced");
    }
  });
    sync3.owlCarousel({
        items : 5,
        slideSpeed : 1000,
        navigation: true,
        pagination:false,
        navigationText: [
            '<i class="fa fa-caret-left left_button" aria-hidden="true"></i>',
            '<i class="fa fa-caret-right right_button" aria-hidden="true"></i>'
        ],
        afterAction : syncPosition,
        responsiveRefreshRate : 200,
    });

  function syncPosition(el){
    var current = this.currentItem;
    $(".thumbnail-product")
      .find(".owl-item")
      .removeClass("synced")
      .eq(current)
      .addClass("synced")
    if($(".thumbnail-product").data("owlCarousel") !== undefined){
      center(current)
    }
  }

  $(".thumbnail-product").on("click", ".owl-item", function(e){
    e.preventDefault();
    var number = $(this).data("owlItem");
    sync1.trigger("owl.goTo",number);
  });

  function center(number){
    var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
    var num = number;
    var found = false;
    for(var i in sync2visible){
      if(num === sync2visible[i]){
        var found = true;
      }
    }

    if(found===false){
      if(num>sync2visible[sync2visible.length-1]){
        sync2.trigger("owl.goTo", num - sync2visible.length+2)
      }else{
        if(num - 1 === -1){
          num = 0;
        }
        sync2.trigger("owl.goTo", num);
      }
    } else if(num === sync2visible[sync2visible.length-1]){
      sync2.trigger("owl.goTo", sync2visible[1])
    } else if(num === sync2visible[0]){
      sync2.trigger("owl.goTo", num-1)
    }

  }

});
