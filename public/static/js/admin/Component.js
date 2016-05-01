/**
 * Created by @VanNguyen: nguyenkhoavan@outlook.com on 1/14/2016.
 */


var Component = function(){

    var initSwitchery = function(){
        var elems = Array.prototype.slice.call(document.querySelectorAll('input[type="checkbox"]'));

        var options = {
            color               : 'rgba(63, 231, 38, 0.5)',
            secondaryColor      : '#307994',
            jackColor           : '#c4edfc',
            jackSecondaryColor  : null,
            className           : 'switchery',
            disabled            : false,
            disabledOpacity     : 0.5,
            speed               : '0.1s',
            size                : 'small'
        };

        elems.forEach(function(html) {
            var switchery = new Switchery(html, options);

            html.onchange = function() {
                var checked = html.checked;
            };
        });
    };

    var initSelect2 = function(){
        $("select[data-widget='select2']").select2({
            placeholder: $(this).attr('placeholder'),
            allowClear: true,
            minimumResultsForSearch: function(){
                return -1;
            }
        });
        $("select[data-widget='tag']").select2({
            tags: true,
            placeholder: $(this).attr('placeholder'),
            allowClear: true,
            minimumResultsForSearch: function(){
                return -1;
            }
        });
    };

    var initDatePicker = function () {
        var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
        $.fn.bootstrapDP = datepicker;

        $("[data-widget='datepicker']").bootstrapDP({
            locale: 'en',
            format: (DATE_FORMAT[LANG]).toLowerCase(),
            showClose: true,
            debug: ENVIRONMENT == 'development'? true: false
        });
    };


    /**
     * Init SlimScroll
     * */
    var initSlimScroll = function(){
        var $elts = $('[data-widget="slimScroll"]');
        $elts.each(function( key, elt ) {
            var me = $(elt);
            var userOpts = JSON.parse(me.attr('data-slimScrollOptions'));
            var defaultOpts = {
                height: me.outerHeight + "px",
                allowPageScroll: true,
                railVisible: true,
                size: '3px'
            };
            var options = $.extend({}, userOpts, defaultOpts);

            me.slimScroll(options);
        });

    };

    /**
     * Init iCheck
     * */
    var initICheck = function(){

        $('[data-widget="iCheck"]').iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });

    };


    /**
     * Init Magnific-Popup
     * */
    var initMagnificPopup = function () {
        $('[data-widget="magnific-popup"]').each(function () {
            $(this).magnificPopup({
                delegate: 'a.mfp-gallery',
                type: 'image',
                closeOnContentClick: false,
                closeBtnInside: true,
                mainClass: 'mfp-with-zoom mfp-img-mobile',
                prependTo: '.right_col',
                image: {
                    verticalFit: true,
                    titleSrc: function(item) {
                        var caption = item.el.attr('data-title');
                        return caption? caption:null;
                    }
                },
                gallery: {
                    enabled: true
                },
                zoom: {
                    enabled: true,
                    duration: 300, // don't forget to change the duration also in CSS
                    opener: function(element) {
                        return element.find('img');
                    }
                }
            });
        });
    };

    /**
     * ..................................................................................*/


    return {
        init: function(){
            initSwitchery();
            initSelect2();
            initDatePicker();
            initSlimScroll();
            initMagnificPopup();
        },
        initSwitchery: function () {
            return initSwitchery();
        },
        initSelect2: function(){
            return initSelect2();
        },
        initDatePicker: function () {
            return initDatePicker();
        },
        initSlimScroll: function(){
            return initSlimScroll();
        },
        initICheck: function() {
            return initICheck();
        },
        initMagnificPopup: function () {
            return initMagnificPopup();
        }
    }
};
