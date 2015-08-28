angular.module('movieDbApp')
    .directive('browsePanelHeading', function () {
        return {
            restrict: 'A',
            templateUrl: 'ng-app/shared/browse_list/_browse_panel_heading.html',
            controller: 'BrowsePanelController',
            scope: {
                title: '@',
                menuitems: '=menuitems'
            }
        };
    });
