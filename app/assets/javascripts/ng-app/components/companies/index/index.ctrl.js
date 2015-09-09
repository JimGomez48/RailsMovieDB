angular.module('movieDbApp')
    .controller('CompaniesIndexCtrl', [
        '$scope',
        '$log',
        function ($scope, $log) {
            $log.debug('instantiate CompaniesIndexCtrl');

            $scope.panelTitle = 'Companies';
            $scope.menuItems = [
                {
                    label: 'company action 1',
                    action: function () {
                        alert('company action 1')
                    }
                },
                {
                    label: 'company action 2',
                    action: function () {
                        alert('company action 2')
                    }
                },
                {
                    label: 'company action 3',
                    action: function () {
                        alert('company action 3')
                    }
                }
            ];
        }]);