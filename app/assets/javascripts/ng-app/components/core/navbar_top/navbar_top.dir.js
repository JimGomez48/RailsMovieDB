angular.module('movieDbApp')
    .directive('navbarTop', function () {
        return {
            restrict: 'EA',
            templateUrl: 'ng-app/components/core/navbar_top/_navbar_top.html',
            controller: 'NavbarTopCtrl'
        }
    });