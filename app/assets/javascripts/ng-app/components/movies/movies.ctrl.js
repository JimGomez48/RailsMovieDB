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
                {title: 'action 1', action: '1'},
                {title: 'action 2', action: '2'},
                {title: 'action 3', action: '3'},
            ];

            var PageCtrl = $controller('PaginatorCtrl', {$scope: $scope});

            // initialize view to page 1 of movie content
            Restangular.all('movies').getList({page: 1}).then(function (movies) {
                $scope.movies = movies;
                $log.debug('Current page: ' + movies.pagination['current_page']);
                $log.debug('Total pages: ' + movies.pagination['total_pages']);
                $log.debug('Total items: ' + movies.pagination['total_items']);
                $log.debug('Items per page: ' + movies.pagination['items_per_page']);
                $scope.$parent.totalItems = movies.pagination['total_items'];
                $scope.$parent.itemsPerPage = movies.pagination['items_per_page'];
                $log.log(PageCtrl.totalItems);
            });

            $rootScope.$on('PageChangedEvent', function (event, args) {
                Restangular.all('movies').getList({page: args.page}).then(function (movies) {
                    $scope.movies = movies;
                });
                $log.info('MOVIES: Page changed to ' + args.page);
            })
        }
    ]);