obj = luajava.newInstance("java.lang.Object")
-- obj is now a reference to the new object
-- created and any of its methods can be accessed.

-- this creates a string tokenizer to the "a,b,c,d"
-- string using "," as the token separator.
strTk = luajava.newInstance("java.util.StringTokenizer", 
    "a,b,c,d", ",")
while strTk:hasMoreTokens() do
    print(strTk:nextToken())
end