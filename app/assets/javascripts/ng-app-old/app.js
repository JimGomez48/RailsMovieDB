(function () {

    var app = angular
        .module('movieDbApp', ['ui.router', 'templates', 'ngAnimate', 'ui.bootstrap', 'restangular']) //restangular
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            '$logProvider',
            'RestangularProvider',
            function ($stateProvider, $urlRouterProvider, $locationProvider, $logProvider, RestangularProvider) {
                $logProvider.debugEnabled(true);

                $stateProvider
                    .state('home', {
                        url: '/',
                        templateUrl: 'ng-app-old/components/home/home.html',
                        controller: 'HomeCtrl'
                    })
                    .state('movies', {
                        abstract: true,
                        url: '/movies',
                        templateUrl: 'ng-app-old/shared/browse_list/_browse_list.html',
                    })
                    .state('movies.list', {
                        url: '',
                        templateUrl: 'ng-app-old/components/movies/movies.html',
                        controller: 'MoviesCtrl'
                    })
                    .state('actors', {
                        abstract: true,
                        url: '/actors',
                        templateUrl: 'ng-app-old/shared/browse_list/_browse_list.html',
                    })
                    .state('actors.list', {
                        url: '',
                        templateUrl: 'ng-app-old/components/actors/actors.html',
                        controller: 'ActorsCtrl'
                    })
                    .state('directors', {
                        abstract: true,
                        url: '/directors',
                        templateUrl: 'ng-app-old/shared/browse_list/_browse_list.html',
                    })
                    .state('directors.list', {
                        url: '',
                        templateUrl: 'ng-app-old/components/directors/directors.html',
                        controller: 'DirectorsCtrl'
                    })
                    .state('reviews', {
                        url: '/reviews',
                        templateUrl: 'ng-app-old/components/reviews/reviews.html',
                        controller: 'HomeCtrl'
                    });

                $urlRouterProvider.otherwise('/');

                $locationProvider.html5Mode({
                    enabled: true,
                    requireBase: false
                });

                var BASE_URL = 'http://' + window.location.host + '/api/v1';
                RestangularProvider.setBaseUrl(BASE_URL);

                /**
                 * Expected json response format:
                 * {
                 *      status: "status" ["success" | "fail" | "error"]
                 *      code:  (optional) numeric error-code if status=="error"
                 *      data:   {...} if single object OR [] if list of objects
                 *      pagination: (optional) {
                 *          current: "current page"
                 *          total: "num pages"
                 *      }
                 * }
                 */

                RestangularProvider.addResponseInterceptor(function (data, operation, what, url, response, deferred) {
                    var extractedData = data.data;
                    if (operation === "getList") {
                        extractedData.pagination = data.pagination;
                    }
                    return extractedData;
                });
            }
        ]);
})();
