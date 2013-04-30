$ ->
  #Source: http://coffeescriptcookbook.com/chapters/arrays/shuffling-array-elements
  shuffle = (a) ->
    # From the end of the list to the beginning, pick element `i`.
    for i in [a.length-1..1]
      # Choose random element `j` to the front of `i` to swap with.
      j = Math.floor Math.random() * (i + 1)
      # Swap `j` with `i`, using destructured assignment
      [a[i], a[j]] = [a[j], a[i]]
    # Return the shuffled array.
    a
  $.reject
    reject:
      msie7: true
      msie8: true
    display: shuffle(["firefox","chrome","opera","msie"]) #don't favour any of these browsers
    header: "Czy wiesz, że Twoja przeglądarka internetowa jest nieaktualna?"
    paragraph1: "Twoja przeglądarka jest nieaktualna i może być nie zgodna z tą stroną internetową.<br>" +
                "Lista najpopularniejszych przeglądarek internetowych znajduje się poniżej."
    paragraph2: "Kliknij na ikonę, aby przejść do strony pobierania"
    close: false
    imagePath: "public/images/browsers/"
