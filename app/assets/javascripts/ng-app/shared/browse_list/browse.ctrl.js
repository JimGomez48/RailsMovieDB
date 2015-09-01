angular.module('movieDbApp')
    .controller('BrowseCtrl', [
        '$scope',
        '$rootScope',
        '$log',
        function ($scope, $rootScope, $log) {
            $scope.currentPage = 1;
            $log.info('Browse controller instantiated!');

            $scope.setPage = function (pageNum) {
                $scope.currentPage = pageNum;
            };

            $scope.getPage = function () {
                return $scope.currentPage;
            };

            $scope.pageChanged = function () {
                $log.info('page changed to: ' + $scope.currentPage);
                $rootScope.$broadcast('PageChangedEvent', {page: $scope.currentPage});
            };

            return $scope;
        }]);