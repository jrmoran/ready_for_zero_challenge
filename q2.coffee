# The following text is an in-order traversal of a binary tree with 1023 nodes.
# What is the sum of the digits appearing in the leaves?

data = 'bDq4i3eFNmjh2oMgjNsIFkRWsonRl=tz9kf8gOpED2gVQrfx49GjR9/QNqTEJkSzM30p4RfneDc7EmdusIYdxxZ8KKdND==YpLlmN/FkErS7uqVHYIyGEBIhIRX+mbg6FjVGqfYjobX3F1lSmPpLXXxhux1lV=EzIgGct9pd=ogzAdJU4/yZOj9=njfvbSo11bcE/yUDHg/J=6DAtmWt+P/VDvE4GyYHlKVGUoksn+Lzm6Y1VVF6qw=onnKZS=CQQUPeMlUGtMobJEeyIyGBMFj5kHml1waI97qgVt/yeKWSXxhJyK+As0M0UR2KL+U7klKMlWlxgbIJ2beN0gaMHbIClKrBuroo+L73CwnbFKRiyKOx8Ke=PPukm1BWYd4Do5nikrT0dgPWlmItCzyZrEiOBgBtEB9FG1qdQJud182qYU4Xwry=bR7R5PH=Npab7JQ7gY=MYHW24iw=m2+XayIachr=QVt4giclLluUEu3Dx/5y7R0GlINqoJc9O6QwEP6a9PRsdt86nZYQUF/b729lzilkM1PB8mDPACTOGobXSJJQshRQCoJoC9TX6ERou/tlMWNQTaaU0YmzIFh8t72lgOeIMu4W2S9V8Y5jO8T47ZPRGxeQDWRQlpx1tc3AC4+x2zJxZaYV6d4+rxxWgYnYC1ZwUvXNF2YLaRw7ldRXCz9/7xZ3mKBj4Ox51L3PqGXAIB+OI4pgkUc1X52tOPdRPgpsfi8wNpynfylwjITvNKq93iViQiyiEVGBgazbHQ7boh5tejStBE1SCk1fMe1=ycNoxJzhAH4x/YlQSUOz/2qkl+JxFBt8sqRYXZjZ6R=Gh87ZwS4B0Meo56/WF+40bf2mTgG05KQ/qR89NMyttHdwwnzvkZuXGrlt/yuStJaXJNkqQ5atDPWqLJy4Q9iylEdI3qmTe6Wmou/umQG7Q+aiOXorJde3Z4CzMyTYnCWvudFDZvgEZsuKRiSOurstnxFRlqVQ0LC7WRuS=qCsDcxoDT5dl9NHusV4kZ/'

# Assumming this is a balanced binary tree, all leaves will be at a
# even zero based index (0,2,4,6,8,10)

total = 0
add = (x)-> total += x

# This will iterate over all items with an even index, and if the item
# can be parsed into a number its value will be passed to *add()*. If it
# cannot be parsed, a 0 will be passed as an argument.
add (if !isNaN(k = parseInt x, 10) then k else 0) for x in data by 2

console.log "The total sum is #{total}"
