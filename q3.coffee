# The following sequence of digits sums to 5824.
#
# Break up the sequence into the LARGEST number of contiguous subsequences
# such that the sums of each of the subsequences are equal.

data = "2298163507642079319714044011236386616537514556458624876361063538594523631728704374833046762730571781372667347996722877761242458964516235987144911867899093570411259125272325950690385718016406645948728247900092493610635939061585125579278248678382561153927262068997135688096479833275438059003000577156030985752302737572142995389102392941277376055589936729467932043612276625158946842268530893693249010877756556663809256430403075836704397788157103267683082146557414910592210694688897583745853279150372366550265606245942901619641524394840947123797093291647952437507481770581519782926025000309975240809176732086412721877283182868239907386563436552684713604652833551208756316179487399401951895977814655415305700855625446129108900687384799001387951671104621436799720362491054813946856845126233235524710982837568591533011593761372364447069814628293634127437282262501219295880363659562599465416237996647317561877859528573985271179776400465798163016446475504146022123819119158936569549701762530276146646914630937941723419963811828693735274888334852800116766879328915880099767105948195091109555590581643322251908783026670007080972249010100892419108486345305849353679974424946961324819560021379840782224833262895740825258961195814695840112138347952831118547888120194142040782810626793593"

# Helper Functions
# ----------------
#
# Sum items in an array
#
#     > sum([1, 2, 3 ,4 ,5])
#     => 15
#
arrsum = (arr)->
  total = 0
  total += x for x in arr
  total

# This takes an array, computes the total sum and splits it into chunks
#
#     > split([1, 2, 3 ,4 ,5])
#     => # sum is 15
#     => [5, 3]
#
# where `5 + 5 + 5 = 15` and `3 + 3 + 3 + 3 + 3 = 15`
split_sum = (arr)->
  sum = arrsum arr
  sums = []
  for i in [2..arr.length]
    sums.push split if (split = sum/i) % 1 is 0

  sums

# This evaluates an array and finds a sequence which elements sum is a given
# number. It returns an array with indices if the sequence is found,
# otherwise -1
#
#     > sequence([1, 2, 3 ,4 ,5], 10, 0)
#     => [0, 3]
#
# where the range 0..3 sums 10. `1 + 2 + 3 + 4 = 10`
sequence = (arr, sum, start)-> 
  for i in [ start..arr.length - 1 ]
    if sum is arrsum arr[start..i]
      last = i
      break

  # return the last index or -1 if a sequence is not found
  if !isNaN last then [start, last] else -1

# Processing
# ----------
#
# starting from the sum of the first two items
process = ->

  # parsing into a numeric array
  arr = []
  arr.push parseInt x, 10 for x in data

  sums = split_sum arr
  max = [0, 0]

  # get all possible chunks
  for sum in sums
    last = arr.length-1
    start = 0
    temp_sequence = []
    sequences_n = 0

    # console.log "evaluating #{sum}"

    while start < last
      temp_sequence = sequence arr, sum, start

      # if a contiguous sequence with a matching sum is not found skip
      # chunk and clean up sequences, otherwise add temporal sequence to 
      # contiguous sequences and set the start index to evaluate next
      # sequence in the array
      if temp_sequence is -1
        break
      else
        start = temp_sequence[1] + 1
        max = [sequences_n, sum] if sequences_n++ > max[0]

  console.log "Max contiguous sequences: #{max[0]}"
  console.log "Sum chunk: #{max[1]}"

# Running
# --------
process()
