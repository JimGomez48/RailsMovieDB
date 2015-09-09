angular.module('movieDbApp')
    .controller('MoviesIndexCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $log.debug('instantiate MoviesIndexCtrl');

            $scope.panelTitle = 'Movies';
            $scope.menuItems = [
                {
                    label: 'movie action 1',
                    action: function () {
                        alert('movie action 1')
                    }
                },
                {
                    label: 'movie action 2',
                    action: function () {
                        alert('movie action 2')
                    }
                },
                {
                    label: 'movie action 3',
                    action: function () {
                        alert('movie action 3')
                    }
                }
            ];
        }]);