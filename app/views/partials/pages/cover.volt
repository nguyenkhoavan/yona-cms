{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/29/2016 #}
{# Time: 4:32 PM #}

{% set image = helper.image([
    'id':           page.getId(),
    'type':         page.getImgFolder("cover_photo"),
    'width':        2560,
    'height':       800,
    'strategy':     'a',
    'stretch':      'false',
    'widthHeight':  'false',
    'hash': true
    ], ['class':'img-responsive'])
%}

<div class="cover-photo">
    {% if image.isExists() %}
        {{ image.imageHtml() }}
    {% endif %}
    <span class="mash"></span>
    {% if content is defined %}
        <div class="article-content">
            <div class="container">
                {#Fill content here if exist#}
                {{ content }}
            </div>
        </div>
    {% endif %}
</div>