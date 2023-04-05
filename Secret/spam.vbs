set shell = createobject("wscript.shell")
count = 0
do until count = 5
count =+ 1
shell.run("msg.vbs")
loop