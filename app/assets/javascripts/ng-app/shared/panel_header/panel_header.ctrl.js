angular.module('movieDbApp')
    .controller('PanelHeaderCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $scope.onMenuItemClick = function(index) {
                $log.info('item ' + index + ' clicked');
            };
        }]);