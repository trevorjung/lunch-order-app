(function() {
  "use strict";

  angular.module("app").controller("lunchesCtrl", function($scope, $http) {
    
    // $scope.selectedMonth = getMonth() +1;

    // $scope.previousMonth = function() {
    //   $scope.selectedMonth -1;
    // }

    // $scope.nextMonth = function () {
    //   $scope.selectedMonth +1;
    // }

    $scope.setup = function() {
      $http.get("/api/v1/lunches.json").then(function(response) {
        $scope.lunches = response.data;
        console.log(response.data);
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
        
        
    
    $scope.deleteOrder = function(index, newOrder) {
      $http.delete("/api/v1/orders/" + newOrder.id + ".json").then(function(response) {
        $scope.selected_lunches.splice(index,1);
        console.log(index);
        });
    }
    
    $scope.total = 0
    $scope.subtotal = 0
    $scope.price = 4.5


    $scope.makeOrder = function() {

        // console.log($scope.selected_lunches[i].entree)

        // var lunch = $scope.selected_lunches[i];
        // var price = lunch.calculateTax($scope.price)

        var subtotal = $scope.calculateSubtotal();
        var tax = $scope.calculateTax();
        var total = $scope.calculateTotal();

        var newOrder = {
          // email: email,
          // date: lunch.date,
          lunches: $scope.selected_lunches,
          // price: 4.5
          // entree: entree,
          // school_name: school_name,
          // lunch_id: lunch.id
          // student_name: lunch.,
          // user_id: current_user.id
          // price: t
          tax: tax,
          subtotal: subtotal,
          total: total
        };

        console.log("New order:");
        console.log(newOrder);

        // var newSelectedDay = {
        //   lunch_id: lunch.id;

        // }
        
          $http.post("/api/v1/orders.json", newOrder).then(function(response) {
             
             console.log(response);

          });
      
        
    } 
        

      

    $scope.calculateTax = function() {
      $scope.tax = ((parseInt($scope.selected_lunches.length) * $scope.price) * 0.09);
      return $scope.tax;
    }

    $scope.calculateSubtotal = function() {
      $scope.subtotal = parseInt($scope.selected_lunches.length) * $scope.price;
      return $scope.subtotal;
    }

    $scope.calculateTotal = function() {
      $scope.total = $scope.tax + $scope.subtotal;
      return $scope.total;
    }


      


        


    window.$scope = $scope;


  });
}());