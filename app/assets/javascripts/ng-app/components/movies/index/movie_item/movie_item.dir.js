angular.module('movieDbApp')
    .directive('movieItem', function () {
        return {
            restrict: 'EA',
            replace: true,
            templateUrl: 'ng-app/components/movies/index/movie_item/_movie_item.html',
            scope: {
                movie: '='
            }
        }
    });