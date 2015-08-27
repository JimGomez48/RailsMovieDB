angular.module('movieDbApp').directive('paginator', function () {
    return {
        restrict: 'E',
        templateUrl: 'ng-app/shared/paginator/_paginator.html'
    };
});
