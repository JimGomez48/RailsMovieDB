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
                    .state('base', {
                        abstract: true,
                        templateUrl: 'ng-app/shared/base/base.html'
                    })
                    .state('home', {
                        parent: 'base',
                        url: '/',
                        templateUrl: 'ng-app/components/home/home.html',
                        controller: 'HomeCtrl'
                    })
                    .state('movies', {
                        parent: 'base',
                        abstract: true,
                        url: '/movies',
                        template: '<ui-view></ui-view>'
                    })
                    .state('movies.index', {
                        url: '',
                        templateUrl: 'ng-app/components/movies/index/index.html',
                        controller: 'MoviesIndexCtrl'
                    })
                    .state('movies.show', {
                        url: '/{movie_id:int}',
                        templateUrl: 'ng-app/components/movies/show/show.html',
                        controller: 'MoviesShowCtrl'
                    })
                    .state('actors', {
                        parent: 'base',
                        abstract: true,
                        url: '/actors',
                        template: '<ui-view></ui-view>'
                    })
                    .state('actors.index', {
                        url: '',
                        templateUrl: 'ng-app/components/actors/index/index.html',
                        controller: 'ActorsIndexCtrl'
                    })
                    .state('directors', {
                        parent: 'base',
                        abstract: true,
                        url: '/directors',
                        template: '<ui-view></ui-view>'
                    })
                    .state('directors.index', {
                        url: '',
                        templateUrl: 'ng-app/components/directors/index/index.html',
                        controller: 'DirectorsIndexCtrl'
                    })
                    .state('companies', {
                        parent: 'base',
                        abstract: true,
                        url: '/companies',
                        template: '<ui-view></ui-view>'
                    })
                    .state('companies.index', {
                        url: '',
                        templateUrl: 'ng-app/components/companies/index/index.html',
                        controller: 'CompaniesIndexCtrl'
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
                 *          current_page: "current page"
                 *          total_pages: "total num pages"
                 *          total_items: "total num items"
                 *          items_per_page: "num items per page"
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
