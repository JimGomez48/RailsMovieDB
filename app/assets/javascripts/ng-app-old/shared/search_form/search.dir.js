angular.module('movieDbApp').directive('searchForm', function() {
    return {
        restrict: 'E',
        templateUrl: 'ng-app-old/shared/search_form/_search.html',
        controller: 'SearchCtrl',
    }
});
