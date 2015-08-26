angular
    .module('movieDbApp', ['ui.router', 'templates'])
    .config([
        '$stateProvider',
        '$urlRouterProvider',
        '$locationProvider',
        function ($stateProvider, $urlRouterProvider, $locationProvider) {
            console.log('CONFIGURING APP MODULE');

            $stateProvider
                .state('home', {
                    url: '/',
                    views: {'home': {
                        templateUrl: 'ng-app/home/_home.html',
                        controller: 'HomeCtrl'
                    }},

                });

            $urlRouterProvider.otherwise('/');

            $locationProvider.html5Mode({
                enabled: true,
                requireBase: false
            });
        }
    ]);