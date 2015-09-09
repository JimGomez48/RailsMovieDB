angular.module('movieDbApp')
    .controller('ActorsIndexCtrl', [
        '$scope',
        '$log',
        'Restangular',
        function ($scope, $log, Restangular) {
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
                        alert('actor action 3')
                    }
                }
            ];

            // initialize list data
            $scope.totalItems = 0;
            $scope.itemsPerPage = 20;
            $scope.currentPage = 0;

            Restangular.all('actors').getList({page: 1}).then(function (actors) {
                $scope.actors = actors;
                $scope.totalItems = actors.pagination['total_items'];
                $scope.itemsPerPage = actors.pagination['items_per_page'];
            });

            $scope.onPageChanged = function () {
                Restangular.all('actors').getList({page: $scope.currentPage}).then(function (actors) {
                    $scope.actors = actors;
                });
            };
        }]);