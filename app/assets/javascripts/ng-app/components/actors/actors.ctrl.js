angular.module('movieDbApp')
    .controller('ActorsCtrl', [
        '$log',
        '$scope',
        '$rootScope',
        'Restangular',
        '$controller',
        function ($log, $scope, $rootScope, Restangular, $controller) {
            // initialize title
            $scope.$parent.panelTitle = 'Actors';
            // initialize menu items
            $scope.$parent.panelMenuItems = [
                {title: 'actor action 1', action: '1'},
                {title: 'actor action 2', action: '2'},
                {title: 'actor action 3', action: '3'},
            ];

            var PageCtrl = $controller('PaginatorCtrl', {$scope: $scope});

            // initialize view to page 1 of movie content
            Restangular.all('actors').getList({page: 1}).then(function (actors) {
                $scope.actors = actors;
                // pass pagination info to base template
                $scope.$parent.totalItems = actors.pagination['total_items'];
                $scope.$parent.itemsPerPage = actors.pagination['items_per_page'];
            });

            $rootScope.$on('PageChangedEvent', function (event, args) {
                Restangular.all('actors').getList({page: args.page}).then(function (actors) {
                    $scope.actors = actors;
                });
            })
        }]);