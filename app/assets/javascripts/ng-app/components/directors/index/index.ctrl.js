angular.module('movieDbApp')
    .controller('DirectorsIndexCtrl', [
        '$scope',
        '$log',
        'Restangular',
        function ($scope, $log, Restangular) {
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

            // initialize list data
            $scope.totalItems = 0;
            $scope.itemsPerPage = 20;
            $scope.currentPage = 0;

            Restangular.all('directors').getList({page: 1}).then(function (directors) {
                $scope.directors = directors;
                $scope.totalItems = directors.pagination['total_items'];
                $scope.itemsPerPage = directors.pagination['items_per_page'];
            });

            $scope.onPageChanged = function () {
                Restangular.all('directors').getList({page: $scope.currentPage}).then(function (directors) {
                    $scope.directors = directors;
                });
            };
        }]);