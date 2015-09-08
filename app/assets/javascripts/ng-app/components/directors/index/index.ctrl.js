angular.module('movieDbApp')
    .controller('DirectorsIndexCtrl', [
        '$scope',
        '$log',
        '$state',
        function ($scope, $log, $state) {
            $log.debug('instantiate DirectorsIndexCtrl');
        }]);