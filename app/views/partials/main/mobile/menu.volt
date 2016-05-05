{%- macro leaf_item(leaf, url) %}
    {% set allChildrenSlugs = leaf.getAllSlugs() %}
    {% set parentSlug       = leaf.page.getSlug()  %}
    <li class="dropdown {{ helper.activeMenu().activeClass(allChildrenSlugs) }}">
        <a href="{{ parentSlug }}.html" >{{ leaf.getTitle() }}</a>
        {% if leaf.hasChildren() %}
            <ul class="dropdown-menu" role="menu">
                {% for child in leaf.children() %}
                    {% set childSlug = child.page.getSlug() %}
                    <li class="{{ helper.activeMenu().activeClass(childSlug) }}"><a href="{{ childSlug }}.html">{{ child.getTitle() }}</a></li>
                {% endfor %}
            </ul>
        {% endif %}
    </li>
{%- endmacro %}

<div class="container">
    <div class="row">
        <div class="navbar navbar-default">
            <div class="navbar-header pull-right">
                <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-slide-dropdown">
                        <ul class="nav navbar-nav navbar-left">
                            {% for root, root_title in roots %}
                                {% if loop.first %}
                                    {% set tree = tree_helper.treeUpperLeafs(root) %}
                                    {% for leaf in tree %}
                                        {{ leaf_item(leaf, url.get()) }}
                                    {% endfor %}
                                {% endif %}
                                {% break %}
                            {% endfor %}
                        </ul>
                        <a href="#" class="btn btn-primary btn-donate"><i class="icons-aa icon-donate-white"></i> {{ helper.translate('Dong gop') }}</a>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div>
        </div>
    </div>
</div>
