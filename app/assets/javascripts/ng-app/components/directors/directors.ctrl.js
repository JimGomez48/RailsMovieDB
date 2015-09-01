angular.module('movieDbApp')
    .controller('DirectorsCtrl', [
        '$log',
        '$scope',
        '$rootScope',
        'Restangular',
        '$controller',
        function ($log, $scope, $rootScope, Restangular, $controller) {
            // initialize title
            $scope.$parent.panelTitle = 'Directors';
            // initialize menu items
            $scope.$parent.panelMenuItems = [
                {title: 'director action 1', action: '1'},
                {title: 'director action 2', action: '2'},
                {title: 'director action 3', action: '3'},
            ];

            var PageCtrl = $controller('PaginatorCtrl', {$scope: $scope});

            // initialize view to page 1 of movie content
            Restangular.all('directors').getList({page: 1}).then(function (directors) {
                $scope.directors = directors;
                // pass pagination info to base template
                $scope.$parent.totalItems = directors.pagination['total_items'];
                $scope.$parent.itemsPerPage = directors.pagination['items_per_page'];
            });

            $rootScope.$on('PageChangedEvent', function (event, args) {
                Restangular.all('directors').getList({page: args.page}).then(function (directors) {
                    $scope.directors = directors;
                });
            })
        }]);