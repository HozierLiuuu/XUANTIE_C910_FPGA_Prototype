target remote 127.0.0.1:1025
#target remote 10.207.132.75:1025

set confirm off
set height 0

set $msmpr = 0x1

# Invalidate & Clear IBP BTB BHT ICache & DCache
set $mcor = 0x70013

# Enable L2 Cache
set $mccr2 = 0xE041000B 

# Enable L1 Cache
# origin:11ff
# close BHT:11df
set $mhcr = 0x11df


# Enable CPU Features
set $mxstatus = 0x638000
#set $mhint = 0x1ee70c 


set *0x18030028=0x0
set *0x1803002c=0x0
set *0x18030030=0x0
set *0x18030034=0x0
set *0x18030038=0x0
set *0x1803003c=0x0
set *0x18030040=0x0
set *0x18030044=0x0

#file  ../vmlinux
#source ../gdbmacros.txt
lo


