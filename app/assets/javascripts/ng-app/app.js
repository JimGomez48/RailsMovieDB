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
                        views: {
                            'home': {
                                templateUrl: 'ng-app/home/_home.html',
                                controller: 'HomeCtrl'
                            }
                        },

                    });

                $urlRouterProvider.otherwise('/');

                $locationProvider.html5Mode({
                    enabled: true,
                    requireBase: false
                });
            }
        ]);

    app.directive('navbarPartial', function() {
        return {
            restrict: 'E',
            templateUrl: 'ng-app/partials/_navbar.html'
        }
    });

    app.directive('footerPartial', function() {
        return {
            restrict: 'E',
            templateUrl: 'ng-app/partials/_footer.html'
        }
    });

    app.directive('lorem', function() {
        return {
            restrict: 'E',
            templateUrl: 'ng-app/partials/_lorem.html'
        }
    });

})();
