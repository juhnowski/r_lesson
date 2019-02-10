var1 = 5
var2 = 35

if((var1+var2)>100){
  print(">100")
} else if ((var1+var2)>75){
  print(">75")
} else if  ((var1+var2)>50){
  print(">50")
} else {
  print("less")
}

switch(1,
       "1" = print("one"),
       "2" = print("two")
)

switch("%",
       "1" = print("one"),
       "2" = print("two"),
       print("default")
)