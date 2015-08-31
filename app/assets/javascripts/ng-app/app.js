(function () {

    var app = angular
        .module('movieDbApp', ['ui.router', 'templates', 'ngAnimate', 'ui.bootstrap', 'restangular']) //restangular
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            'RestangularProvider',
            function ($stateProvider, $urlRouterProvider, $locationProvider, RestangularProvider) {
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
