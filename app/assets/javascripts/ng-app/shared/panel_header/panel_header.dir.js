angular.module('movieDbApp')
    .directive('panelHeader', function () {
        return {
            restrict: 'EA',
            replace: true,
            templateUrl: 'ng-app/shared/panel_header/_panel_header.html',
            controller: 'PanelHeaderCtrl',
            scope: {
                title: '@',
                menuItems: '='
            }
        }
    });