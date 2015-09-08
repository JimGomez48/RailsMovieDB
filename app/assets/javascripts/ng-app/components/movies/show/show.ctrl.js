angular.module('movieDbApp')
    .controller('MoviesShowCtrl', [
        '$scope',
        'log',
        function ($scope, $log) {
            $log.debug('instantiate MoviesShowCtrl');
        }]);