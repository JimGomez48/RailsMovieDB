angular.module('movieDbApp').directive('navbarSection', function() {
    return {
        restrict: 'E',
        templateUrl: 'ng-app-old/components/core/top_navbar/_navbar.html',
        controller: 'NavbarCtrl',
    }
});
