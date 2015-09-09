angular.module('movieDbApp').directive('searchForm', function() {
    return {
        restrict: 'E',
        replace: true,
        templateUrl: 'ng-app/shared/search_form/_search.html',
        controller: 'SearchCtrl'
    }
});
