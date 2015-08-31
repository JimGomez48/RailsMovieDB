angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$scope',
        'Restangular',
        '$controller',
        function ($scope, Restangular, $controller) {
            //var PageCtrl = $controller('PaginatorCtrl', {});

            $scope.$parent.panel_title = 'Movies';

            $scope.$parent.panel_menu_items = [
                {title: 'action 1', action: '1'},
                {title: 'action 2', action: '2'},
                {title: 'action 3', action: '3'},
            ];

            Restangular.all('movies').getList({page: 3}).then(function (movies) {
                $scope.movies = movies;
                console.log(movies.pagination);
                console.log('Current page: ' + movies.pagination['current_page']);
                console.log('Total pages: ' + movies.pagination['total_pages']);
                console.log('Total items: ' + movies.pagination['total_items']);
                console.log('Items per page: ' + movies.pagination['items_per_page']);
            });
        }
    ]);