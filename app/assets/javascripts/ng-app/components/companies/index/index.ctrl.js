angular.module('movieDbApp')
    .controller('CompaniesIndexCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $log.debug('instantiate CompaniesIndexCtrl');
        }]);