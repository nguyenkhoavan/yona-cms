<form method="post" class="ui form" action="" enctype="multipart/form-data">

    {{ helper.modulePartial('admin/_partials/formactions', ['model': model], 'page') }}

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    {{ form.renderDecorated('title') }}
                    {{ form.renderDecorated('slug') }}

                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            {{ form.renderDecorated('cover_photo') }}
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            {{ form.renderDecorated('thumbnail_photo') }}
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    {{ form.renderDecorated('text') }}
                </div>

                <div class="col-xs-12">
                    {{ form.renderDecorated('meta_title') }}
                    {{ form.renderDecorated('meta_description') }}
                    {{ form.renderDecorated('meta_keywords') }}
                </div>
            </div>
        </div>
    </div>

    {{ helper.modulePartial('admin/_partials/formactions', ['model': model], 'page') }}

</form>

<script type="text/javascript" src="{{ url.get() }}vendor/tiny_mce_3/tiny_mce.js"></script>
<script type="text/javascript">
    tinyMCE.init({
        // General options
        selector: "#text",
        language: "en", // "ru"
        height: "500px",
        theme: "advanced",
        plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

        // Theme options
        theme_advanced_buttons1 : ",bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontsizeselect,|,forecolor,backcolor",
        theme_advanced_buttons2 : "pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink,anchor,image,cleanup,code,template,|,charmap,iespell,media,advhr,template",
        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,fullscreen",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
        theme_advanced_blockformats : "p,h1,h2,h3,h4",
        theme_advanced_font_sizes: "9px,10px,11px,12px,13px,14px,15px,16px,17px,18px,19px,20px",
        browser_spellcheck : true,

        relative_urls : false,
        convert_urls : true,

        element_format : "html5",
        extended_valid_elements: "a[*],i[*],section[*],span[*]",

        file_browser_callback : 'elFinderBrowser_3',

        // Skin options
        skin : "o2k7",
        skin_variant : "silver",

        template_templates : [
            {
                title: "Giới thiệu",
                src: "{{ url(['for':'page-layout', 'name':'about-us']) }}",
                description: "Template"
            },
        ],

        // Example content CSS (should be your site CSS)
        content_css : [
            "{{ url.get() }}static/css/tinymce.css",
            {#"{{ url.get() }}static/css/main.bootstrap/main.bootstrap.min.css",#}
            {#"{{ url.get() }}static/css/main/main.min.css",#}
        ]
    });
</script>