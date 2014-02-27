main = ($scope, $http) ->
  $scope.hash = []
  $scope.change = ->
    hash = $scope.hash
    sentence = []
    count = 1
    comma = <[， ， ； 。 。 。]>
    for i from 6 to 99
      if !hash[i] => continue
      b = hash[i]
      idx = parseInt( Math.random! * b.length )
      sentence.push b[idx]
      cidx = parseInt( Math.random! * count )
      if cidx > 3 => count = 1 else count++
      if i == 99 => cidx = comma.length - 1
      sentence.push comma[cidx]
    $scope.content = sentence.join ""
  $http.get \sentence-stat.json .success (hash) ->
    $scope.hash = hash
    $scope.change!
