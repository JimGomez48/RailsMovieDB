angular.module('movieDbApp')
    .controller('ActorsIndexCtrl', [
        '$scope',
        '$log',
        '$state',
        function ($scope, $log, $state) {
            $log.debug('instantiate ActorsIndexCtrl');

            $scope.panelTitle = 'Actors';
            $scope.menuItems = [
                {
                    label: 'actor action 1',
                    action: function () {
                        alert('actor action 1')
                    }
                },
                {
                    label: 'actor action 2',
                    action: function () {
                        alert('actor action 2')
                    }
                },
                {
                    label: 'actor action 3',
                    action: function () {
                        alert('movie action 3')
                    }
                }
            ];
        }]);