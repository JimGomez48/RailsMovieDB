angular.module('movieDbApp')
    .controller('MoviesIndexCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $log.debug('instantiate MoviesIndexCtrl');
        }]);