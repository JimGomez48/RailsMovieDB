angular.module('movieDbApp')
    .controller('HomeCtrl', [
        '$scope',
        function ($scope) {
            $scope.alerts = [
                {type: 'info', title: "What's up!", msg: 'Go ahead and play with the site'},
                {type: 'success', title: 'What Works?', msg: 'Just basic front-end routing from the navbar'},
                {type: 'danger', title: "What doesn't Work", msg: 'Everything else :('},
            ];

            $scope.closeAlert = function(index) {
                $scope.alerts.splice(index, 1);
            };

        }
    ]);