main = ($scope, $http) ->
  $scope.hash = []
  $scope.change = ->
    hash = $scope.hash
    sentence1 = []
    sentence2 = []
    sentence = sentence1
    heading = ""
    count = 1
    p1max = 25
    p2max = 45
    comma = <[， ， ； 。 。 。]>
    for i from 6 to 99
      # randomly skip some slot
      if Math.random!*10 <3 or !hash[i] => continue
      b = hash[i]
      if sentence1.length >= p1max * 2 and heading == "" =>
        heading = b[idx]
        sentence = sentence2
        continue
      idx = parseInt( Math.random! * b.length )
      sentence.push b[idx]
      cidx = parseInt( Math.random! * count )
      if cidx > 3 => count = 1 else count++
      if i == 99 or sentence1.length == 2 * p1max - 1 => cidx = comma.length - 1
      sentence.push comma[cidx]
      if sentence2.length > 2 * p2max => break
    sentence[* - 1] = "。"
    $scope.content1 = sentence1.join ""
    $scope.content2 = sentence2.join ""
    $scope.heading = heading
  $http.get \sentence-stat.json .success (hash) ->
    $scope.hash = hash
    $scope.change!
