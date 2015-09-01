angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$log',
        '$scope',
        '$rootScope',
        'Restangular',
        '$controller',
        function ($log, $scope, $rootScope, Restangular, $controller) {
            // initialize title
            $scope.$parent.panelTitle = 'Movies';
            // initialize menu items
            $scope.$parent.panelMenuItems = [
                {title: 'movie action 1', action: '1'},
                {title: 'movie action 2', action: '2'},
                {title: 'movie action 3', action: '3'},
            ];

            var PageCtrl = $controller('PaginatorCtrl', {$scope: $scope});

            // initialize view to page 1 of movie content
            Restangular.all('movies').getList({page: 1}).then(function (movies) {
                $scope.movies = movies;
                // pass pagination data to base template
                $scope.$parent.totalItems = movies.pagination['total_items'];
                $scope.$parent.itemsPerPage = movies.pagination['items_per_page'];
            });

            $rootScope.$on('PageChangedEvent', function (event, args) {
                Restangular.all('movies').getList({page: args.page}).then(function (movies) {
                    $scope.movies = movies;
                });
            })
        }
    ]);