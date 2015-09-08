angular.module('movieDbApp')
    .controller('ActorsIndexCtrl', [
        '$scope',
        '$log',
        '$state',
        function ($scope, $log, $state) {
            $log.debug('instantiate ActorsIndexCtrl');
        }]);