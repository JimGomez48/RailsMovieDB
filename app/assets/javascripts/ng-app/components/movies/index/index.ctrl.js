angular.module('movieDbApp')
    .controller('MoviesIndexCtrl', [
        '$scope',
        '$log',
        'Restangular',
        function ($scope, $log, Restangular) {
            $log.debug('instantiate MoviesIndexCtrl');

            // initialize panel
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

            // initialize list data
            $scope.totalItems = 0;
            $scope.itemsPerPage = 20;
            $scope.currentPage = 0;

            Restangular.all('movies').getList({page: 1}).then(function (movies) {
                $scope.movies = movies;
                $scope.totalItems = movies.pagination['total_items'];
                $scope.itemsPerPage = movies.pagination['items_per_page'];
            });

            $scope.onPageChanged = function () {
                Restangular.all('movies').getList({page: $scope.currentPage}).then(function (movies) {
                    $scope.movies = movies;
                });
            };
        }]);