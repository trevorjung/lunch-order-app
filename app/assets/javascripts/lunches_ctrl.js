(function() {
  "use strict";

  angular.module("app").controller("lunchesCtrl", function($scope, $http) {
    
    $scope.selectedMonth = getMonth() +1;

    $scope.previousMonth = function() {
      getMonth() -1;
    }

    $scope.nextMonth = function () {
      getMonth() +1;
    }

    $scope.setup = function() {
      $http.get("/api/v1/lunches.json").then(function(response) {
        $scope.lunches = response.data;
      });
    } 

    $scope.selected_lunches = [];
    
    $scope.selectedLunch = function(lunch) {
      lunch.added = !lunch.added;
    }  

    $scope.addLunch = function(lunch, index) {
        $scope.selectedLunch(lunch);
      if (lunch.added) {
        // lunch.lunch_id = lunch.id
        // lunch.user_id = 
      

        $scope.selected_lunches.push(lunch);
      } 
      else {
        $scope.selected_lunches.splice(index,1);
      }
        console.log($scope.selected_lunches);
    }

      
    $scope.total = 0
    $scope.subtotal = 0
    $scope.price = 4.5

    $scope.calculateTax = function() {
      $scope.tax += (($scope.price * $scope.selected_lunches.length) * 0.09);
    }

    $scope.calculateSubtotal = function() {
      $scope.subtotal += $scope.subtotal + $scope.tax
    }

    $scope.calculateTotal = function() {
      $scope.total = $scope.tax + $scope.subtotal
    }


    $scope.makeOrder = function(array) {
      for (var i=0; i<= $scope.selected_lunches.length; i++) {
        
          $http.post("/api/v1/orders.json", newOrder).then(function(response) {
            $scope.makeOrder = response.data;
          });
      }
      var newOrder = {
        email: email,
        date: date,
        entree: entree,
        school_name: school_name,
        student_name: student_name,
        // user_id: current_user.id
        // price: price
        // tax: 
        // subtotal: current_user.id
        // total: 
      };
        
    } 
      


        


    window.$scope = $scope;


  });
}());