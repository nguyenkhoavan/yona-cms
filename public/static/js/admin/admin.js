$(document).ready(function(){

    /**
     * Init Component
     * -----------------------------
     * */
    var component = new Component();
    component.init();

    /** ---------------------------------------- */

    function elFinderBrowser_3 (field_name, url, type, win) {
        var elfinder_url = '/vendor/elfinder-2.1/elfinder_tinymce_3.html';    // use an absolute path!
        tinyMCE.activeEditor.windowManager.open({
            file:       elfinder_url,
            title:      'elFinder 2.0',
            width:      900,
            height:     450,
            resizable:  'yes',
            inline:     'yes',    // This parameter only has an effect if you use the inlinepopups plugin!
            popup_css:  false, // Disable TinyMCE's default popup CSS
            close_previous: 'no'
        }, {
            window: win,
            input: field_name
        });
        return false;
    }

    $('[data-description]').each(function(index, element){
        var description         = $(element).attr('data-description');
        var descriptionElement  = $('<div class="description">');
        descriptionElement.html(description);
        $(element).after(descriptionElement);
    });


    function selectText(element) {
        var selection   = window.getSelection();
        var range       = document.createRange();
        range.selectNodeContents(element);
        selection.removeAllRanges();
        selection.addRange(range);
    }

    /**
     * Init show/hide text box for donate-text
     * */
    $("body").on('change', '.enable-donate-button', function(){
        $('.donate-text').toggleClass('hide');
    });

    var initEditWidgetOrder = function () {
        var target = $('table.static-widget');
        target.on('change', '.edit-order', function (e) {
            var me          = $(this),
                value       = me.val(),
                url         = me.data('href');
            $.post(url, {'order': value}, function (e) {
                var data    = JSON.parse(e.response);
                me.val(data.data);
            });
        });
    }();


    /*
     *Generate slug automatically*
     *                           */

    var postData = function() {
        $.ajax({
            url: "{{ url.get(['for': 'page-generate-slug']) }}",
            data: $(this).val(),
            success: function(result){
                console.log(result);
            }
        });
    };

    var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
    })();

    $('#title').keyup(function() {
        delay(
            function() {
                var data = { title: $('#title').val(), url: $('#title').data('url') };
                var slug = $("input[name='slug']");
                slug.attr("disabled", "disabled");
                slug.val('LOADING...');

                $.ajax({
                    url:        data.url,
                    method:     "post",
                    data:        data,
                    dataType:   'json',
                    success: function(res) {
                        slug.val(res.slug);
                        slug.removeAttr('disabled');
                    },

                });
            }
            , 300 );
    });

    $('span.assignedSlug').closest("div").css({"color": "red", "border": "2px solid red"});



});
