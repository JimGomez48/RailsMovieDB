(function() {
    var app = angular
        .module('movieDbApp', ['templates', 'ui.router', 'ngAnimate', 'restangular'])
        .config(function($stateProvider, $urlRouterProvider, $locationProvider) {
            $stateProvider.state('home', {
                url: '/',
                templateUrl: 'home/index.html',
                controller: 'HomeController'
            });
            // default fall back route
            $urlRouterProvider.otherwise('/');

            // enable HTML5 Mode for SEO
            $locationProvider.html5Mode(true);
        });
})();