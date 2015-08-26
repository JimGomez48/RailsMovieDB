(function () {

    var app = angular
        .module('movieDbApp', ['ui.router', 'templates', 'ngAnimate']) //restangular
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
                        url: '/movies',
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
