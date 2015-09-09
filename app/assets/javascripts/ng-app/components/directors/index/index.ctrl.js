angular.module('movieDbApp')
    .controller('DirectorsIndexCtrl', [
        '$scope',
        '$log',
        '$state',
        function ($scope, $log, $state) {
            $log.debug('instantiate DirectorsIndexCtrl');

            $scope.panelTitle = 'Directors';
            $scope.menuItems = [
                {
                    label: 'director action 1',
                    action: function () {
                        alert('director action 1')
                    }
                },
                {
                    label: 'director action 2',
                    action: function () {
                        alert('director action 2')
                    }
                },
                {
                    label: 'director action 3',
                    action: function () {
                        alert('director action 3')
                    }
                }
            ];
        }]);