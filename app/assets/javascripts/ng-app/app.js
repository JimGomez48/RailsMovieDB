(function () {

    var app = angular
        .module('movieDbApp', ['ui.router', 'templates', 'ngAnimate', 'ui.bootstrap']) //restangular
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            function ($stateProvider, $urlRouterProvider, $locationProvider) {
                console.log('CONFIGURING APP MODULE');

                $stateProvider
                    .state('home', {
                        url: '/',
                        templateUrl: 'ng-app/components/home/home.html',
                        controller: 'HomeCtrl'
                    })
                    .state('movies', {
                        abstract: true,
                        url: '/movies',
                        templateUrl: 'ng-app/shared/browse_list/_browse_list.html',
                    })
                    .state('movies.list', {
                        url: '/list',
                        templateUrl: 'ng-app/components/movies/movies.html',
                        controller: 'MoviesCtrl'
                    })
                    .state('actors', {
                        url: '/actors',
                        templateUrl: 'ng-app/components/actors/actors.html',
                        controller: 'HomeCtrl'
                    })
                    .state('directors', {
                        url: '/directors',
                        templateUrl: 'ng-app/components/directors/directors.html',
                        controller: 'HomeCtrl'
                    })
                    .state('reviews', {
                        url: '/reviews',
                        templateUrl: 'ng-app/components/reviews/reviews.html',
                        controller: 'HomeCtrl'
                    });

                $urlRouterProvider.otherwise('/');

                $locationProvider.html5Mode({
                    enabled: true,
                    requireBase: false
                });
            }
        ]);
})();
