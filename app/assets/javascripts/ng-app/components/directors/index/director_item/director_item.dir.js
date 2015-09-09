angular.module('movieDbApp')
    .directive('directorItem', function () {
        return {
            restrict: 'EA',
            replace: true,
            templateUrl: 'ng-app/components/directors/index/director_item/_director_item.html',
            scope: {
                director: '='
            }
        }
    });