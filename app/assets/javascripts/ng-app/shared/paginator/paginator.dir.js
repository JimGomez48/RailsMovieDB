angular.module('movieDbApp').directive('paginator', function () {
    return {
        restrict: 'E',
        templateUrl: 'ng-app/shared/paginator/_paginator.html',
        controller: 'PaginatorCtrl',
        scope: {
            current_page: '@',
            total_items: '=',
            items_per_page: '='
        }
    };
});
