<?php
/**
 * @copyright Copyright (c) 2011 - 2014 Oleksandr Torosh (http://wezoom.net)
 * @author Oleksandr Torosh <web@wezoom.net>
 */

namespace Application\Mvc\Helper;

use Cms\Model\Language;
use Phalcon\Mvc\User\Component;
use Application\Mvc\Helper\ArrayHelper;

class LangSwitcher extends Component
{

    public function render($lang, $string)
    {
        $router = $this->getDI()->get('router');
        $view = $this->getDI()->get('view');
        $url = $this->getDI()->get('url');
        $requestQuery = new RequestQuery();

        $matched_route = $router->getMatchedRoute();

        if ($matched_route) {
            $route_name = $matched_route->getName();
            $route_name_changed = $this->changeRouteName($route_name, $lang);

            $route_exitsts = $router->getRouteByName($route_name_changed);
            if ($route_exitsts) {
                $url_args = array();
                $url_args['for'] = $route_name_changed;

                $route_params = $this->calRouterParams($lang, $router);
                if ($route_params) {
                    foreach ($route_params as $param_key => $param_val) {
                        $url_args[$param_key] = $param_val;
                    }
                }

                $href = $url->get($url_args);
            } else {
                $uri = $router->getRewriteUri();
                $href = $uri . $requestQuery->getSymbol() . '?lang=' . $lang;
            }
        } else {
            $uri = $router->getRewriteUri();
            $href = $uri . $requestQuery->getSymbol() . '?lang=' . $lang;
        }

        if ($lang == LANG) {
            $html = '<a class="btn btn-language noajax disabled" href="javascript:;"><i class="icons-ciss icon-flag-'.$lang.'"></i></a>';
        } elseif ($view->disabledLang == $lang) {
            $html = '<a class="btn btn-language noajax disabled" href="javascript:;"><i class="icons-ciss icon-flag-'.$lang.'"></i></a>';
        } else {
            $html = '<a class="btn btn-language noajax" href="' . $href . '"><i class="icons-ciss icon-flag-'.$lang.'"></i></a>';
        }

        return $html;

    }

    private function changeRouteName($route_name, $lang)
    {
        $iso_array = Language::findCachedLanguagesIso();
        if (!empty($iso_array)) {
            foreach ($iso_array as $iso) {
                $route_name = str_replace('_' . $iso, '', $route_name);
            }
        }
        return $route_name . '_' . $lang;
    }

    private function calRouterParams($lang, $router){
        $routerParams = $router->getParams();
        $moduleName = $router->getModuleName();
        if($moduleName == 'index') return $routerParams;
        if(!isset($routerParams['slug'])) return $routerParams;

        $namespace = ucfirst($moduleName).'\\Model\\'.ucfirst($moduleName);
        $model = $namespace::findCachedBySlug($routerParams['slug']);
        $allSlugs = $model->getTranslates(['conditions'=>'key="slug"'])->toArray();
        $allSlugs = ArrayHelper::map($allSlugs, 'lang', 'value');

        $slug = '';
        if(isset($allSlugs[$lang])){
            $slug = $allSlugs[$lang];
        }
        $routerParams['slug'] = $slug;
        return $routerParams;
    }
} 
