angular.module('movieDbApp')
    .directive('actorItem', function () {
        return {
            restrict: 'EA',
            replace: true,
            templateUrl: 'ng-app/components/actors/index/actor_item/_actor_item.html',
            scope: {
                actor: '='
            }
        }
    });