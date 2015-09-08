angular.module('movieDbApp')
    .controller('MoviesIndexCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $log.debug('instantiate MoviesIndexCtrl');

            $scope.panelTitle = 'Movies';
            $scope.menuItems = [
                {label: 'action 1'},
                {label: 'action 2'},
                {label: 'action 3'},
            ]

        }]);