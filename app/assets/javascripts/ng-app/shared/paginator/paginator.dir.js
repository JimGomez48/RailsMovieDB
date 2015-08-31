angular.module('movieDbApp').directive('paginator', function () {
    return {
        restrict: 'E',
        templateUrl: 'ng-app/shared/paginator/_paginator.html',
        controller: 'PaginatorCtrl',
        scope: {
            currentPage: '@',
            totalItems: '=',
            itemsPerPage: '='
        }
    };
});
